import 'dart:async';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:memont_v2/apis/content/content_api.dart';

import 'package:memont_v2/apis/tag/tag_api.dart';

import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';

import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';
import 'package:memont_v2/models/get_tag_dto/get_tag_dto.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';

import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/screens/talk_screen/widgets/bottom_input_wrapper/bottom_input_wrapper.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/memo_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/pin_memo_item/pin_memo_item.dart';

import 'package:memont_v2/utils/util_hooks.dart';

import 'package:collection/collection.dart';

import 'package:memont_v2/widgets/common_layout.dart';

import 'package:provider/provider.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({
    super.key,
  });

  @override
  State<TalkScreen> createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  TextEditingController bottomInputController = TextEditingController();
  String textInput = '';
  ContentDto? selectedContent;
  bool isOpenTagMenu = false;
  TagDto? searchedTag;
  ContentDto? pinContent;

  final PagingController<int, ContentDto> pagingController = // ContentDto
      PagingController(firstPageKey: 0);

  // 태그 목록 불러와서 tag provider에 세팅해줌
  // P_TODO: 이건 그럼 아예 init 화면으로 뺼수도?
  void setTagList() async {
    var tagProvider = Provider.of<TagProvider>(context, listen: false);

    GetTagDto getTagDto = GetTagDto(cursor: tagProvider.cursor);
    try {
      var tagResult = await TagApi.getListByCursor(getTagDto);
      if (tagResult != null) {
        tagProvider.tag = tagResult;
      }
    } catch (err) {
      if (!mounted) return;
      UtilHooks.useCustomToast(
        context: context,
        content: '태그 목록을 불러오는데에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
      );
    }
  }

  // 무한스크롤 형식으로 데이터 받이오기
  Future<void> getContentInfinityScroll(int pageKey) async {
    try {
      await Future.delayed(const Duration(microseconds: 500));
      GetContentDto getContentDto = GetContentDto(cursor: pageKey);

      var contentList = await ContentApi.getListByCursor(getContentDto);
      if (contentList == null) throw '';

      bool isLast = contentList.cursor == null;
      if (isLast) {
        pagingController.appendLastPage(contentList.data);
      } else {
        pagingController.appendPage(contentList.data, contentList.cursor);
      }
    } catch (e) {
      if (!mounted) return;
      UtilHooks.useCustomToast(
        context: context,
        content: '메모를 불러오는데에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
      );
      pagingController.error = e;
    }
  }

  // 아이템 확대보기
  void onPressItemExpendButton(ContentDto? content) {
    setState(() {
      if (content == null) {
        selectedContent = null;
      } else {
        selectedContent = content;
      }
    });
  }

  // 수정버튼 클릭
  void onPressMoreEditButton(ContentDto? content) {
    selectedContent = content;
    String string = '${content?.content}';
    if (content?.tag?.name != null) string += ' #${content?.tag?.name}';
    bottomInputController.text = string;
    setState(() => isOpenTagMenu = true);
  }

  // 삭제버튼 눌렀을 떄
  void onPressMoreDeleteButton(ContentDto? content) {
    UtilHooks.useShowCustomDialog(
      context: context,
      title: '메모 삭제',
      content: '이 메모를 삭제할까요?',
      buttonList: [
        DialogButton(
          text: '확인',
          onPress: () {
            if (content == null) return;
            ContentApi.delete(content.id!);
            pagingController.itemList = pagingController.itemList!
                .where((ele) => ele.id != content.id)
                .toList();
          },
        )
      ],
    );
  }

  //  태그보기버튼 눌렀을 떄 구현해야 함.
  void onPressMoreTagViewButton(ContentDto? content,
      {bool isToBeDeleted = false}) {
    var tagId = isToBeDeleted
        ? '-1'
        : content?.tag?.id == null
            ? '0'
            : content?.tag?.id.toString();

    var uri = Uri(
      path: '/detail/$tagId',
    ).toString();
    context.push(uri).then(refreshBack);
  }

  void onPressRemovePinContentButton(
    ContentDto? content,
  ) {}

  // 콘텐츠 상단고정 (핀)
  void onPressMorePinButton(ContentDto? content) async {
    var updatedPinContent = await ContentApi.patchPinContent(content?.id);
    setState(() => pinContent = updatedPinContent);
    // 서버에서 줘야할 것 같은데?
  }

  // route.back 등으로 돌아왔을 때 refresh 시키기 위한 이벤트
  FutureOr refreshBack(dynamic value) {
    pagingController.refresh();
  }

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) async {
      getContentInfinityScroll(pageKey);
      pinContent = await ContentApi.getPinContent();
    });
    // P_MEMO: 빌드가 끝나는 시점에 실행함.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setTagList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var tagProvider = context.watch<TagProvider>();

    // tag Menu open, 추천태그 표시
    void onChangeTextInput(String text) {
      // P_TODO: 태그 뽑는거 utils로 빼자.
      var arr = text.split('#');
      bool hasTag = arr.asMap().containsKey(1);
      String? tagName = hasTag ? arr[1] : null;
      setState(() {
        isOpenTagMenu = text.isNotEmpty;
      });
      if (tagName == null) return;

      TagDto? target = tagProvider.tagList
          .firstWhereOrNull((ele) => ele.name.contains(tagName));

      setState(() {
        searchedTag = target;
      });
    }

    // + 눌러서 저장, 수정
    void onPressSaveMemoButton() async {
      try {
        // P_TODO: global로 하면 뒤 배경까지 안보이는 이슈.  따로 처리해야 함.
        // appState.isLoading = true;
        var arr = bottomInputController.text.split('#');
        String content = arr[0].trim();
        if (content == '') return;

        bool hasTag = arr.asMap().containsKey(1);
        String? tagName = hasTag ? arr[1] : null;

        if (selectedContent == null) {
          var contentDto = ContentDto(
            content: content,
            tagName: tagName,
            isToBeDeleted: tagName == null,
          );

          var newContent = await ContentApi.createMemo(contentDto);

          if (newContent != null) {
            pagingController.itemList?.insert(0, newContent);
          }
        } else {
          var contentDto = ContentDto(
            content: content,
            tagName: tagName,
            id: selectedContent?.id,
          );
          var updatedContent = await ContentApi.update(contentDto);

          pagingController.itemList = pagingController.itemList
              ?.map((ele) =>
                  ele.id != selectedContent?.id ? ele : updatedContent!)
              .toList();
          if (updatedContent?.id == pinContent?.id) {
            pinContent = updatedContent;
          }
          selectedContent = null;
        }

        setState(() {
          bottomInputController.clear();
          isOpenTagMenu = false;
        });
      } catch (err) {
        if (!mounted) return;
        UtilHooks.useCustomToast(
          context: context,
          content: '메모 저장에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
        );
      }
    }

    // tag button 클릭
    void onPressInputBoxTagItemButton(TagDto? tag) {
      var arr = bottomInputController.text.split('#');
      String newString = '${arr[0].trim()} #${tag?.name ?? ''}';
      bottomInputController.text = newString;
    }

    // untag / 삭제예정 변환 버튼
    void onPressItemUnTagButton(List<int> idList) async {
      // P_TODO: 현재는 한개씩 적용. 추후에는 api 호출 횟수 조절을 위해 debounce로 한번에 처리.

      try {
        ContentApi.toggleToBeDeleted(idList);
        pagingController.itemList = pagingController.itemList
            ?.map((ele) => !idList.contains(ele.id)
                ? ele
                : ele.copyWith(isToBeDeleted: !ele.isToBeDeleted!))
            .toList();
      } catch (err) {
        if (!mounted) return;
        UtilHooks.useCustomToast(
          context: context,
          content: '토글 항목 변경에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
        );
      }
    }

// P_MEMO: 눌렀을 때 input을 닫기 위함.
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CommonLayout(
        child: Scaffold(
          backgroundColor: colors.gray[100],
          // P_TODO: 이거 웹에서는 어떻게 나오는지 확인해야 함
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: CommonAppBar(
              iconButtonList: [
                AppBarIconButton(
                  routes: ROUTES.setting,
                  iconData: FontAwesomeIcons.gear,
                  routeThen: refreshBack,
                ),
                AppBarIconButton(
                  routes: ROUTES.tag,
                  iconData: FontAwesomeIcons.tag,
                  routeThen: refreshBack,
                )
              ],
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // P_MEMO pin 항목이 들어갈 영역.
              if (pinContent != null)
                Container(
                  color: colors.primary[500],
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 12),
                  child: PinMemoItem(
                    content: pinContent!,
                    onPressMoreTagViewButton: onPressMoreTagViewButton,
                    onPressRemovePinContentButton: onPressMorePinButton,
                  ),
                ),

              // P_MEMO: 아이템 영역
              Expanded(
                child: PagedListView<int, ContentDto>(
                  pagingController: pagingController, //저장했던 정보들
                  reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  builderDelegate: PagedChildBuilderDelegate<ContentDto>(
                    itemBuilder: (context, item, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: MemoItem(
                        content: item,
                        onPressItemUnTagButton: onPressItemUnTagButton,
                        onPressMoreEditButton: onPressMoreEditButton,
                        onPressMoreDeleteButton: onPressMoreDeleteButton,
                        onPressMoreTagViewButton: onPressMoreTagViewButton,
                        onPressMorePinButton: onPressMorePinButton,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Input 등등
              BottomInputWrapper(
                isOpenTagMenu: isOpenTagMenu,
                searchedTag: searchedTag,
                bottomInputController: bottomInputController,
                onPressSaveMemoButton: onPressSaveMemoButton,
                onChangeTextInput: onChangeTextInput,
                onPressInputBoxTagItemButton: onPressInputBoxTagItemButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
