import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/apis/content/content_api.dart';

import 'package:memont_v2/apis/tag/tag_api.dart';

import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';

import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';

import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/screens/talk_screen/widgets/bottom_input_wrapper/bottom_input_wrapper.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/memo_item.dart';
import 'package:memont_v2/theme/color/app_colors_extension.dart';
import 'package:memont_v2/theme/textStyle/app_text_style_extension.dart';
import 'package:memont_v2/utils/util_hooks.dart';
import 'package:memont_v2/utils/util_method.dart';

import 'package:collection/collection.dart';

import 'package:memont_v2/widgets/common_layout.dart';
import 'package:memont_v2/widgets/pressable.dart';
import 'package:provider/provider.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:intl/intl.dart';

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

  final PagingController<int, ContentDto> pagingController = // ContentDto
      PagingController(firstPageKey: 0);

  // 태그 목록 불러와서 tag provider에 세팅해줌
  void setTagList() async {
    var tagProvider = Provider.of<TagProvider>(context, listen: false);

    try {
      var tagList = await TagApi.getList();
      if (tagList != null) {
        tagProvider.tagList = tagList;
      }
      print('저장된 tag provider ? ${tagProvider.tagList}');
    } catch (err) {
      print('tag list 핸들링 에러 ${err}');
    }
  }

  // 무한스크롤 형식으로 데이터 받이오기
  Future<void> getContentInfinityScroll(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
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
      print("memo content 불러오기 에러: $e");
      pagingController.error = e;
    }
  }

  // P_TODO: 함수 이름 바꾸자. moreButton 은 따로 구현해야할듯.
  void onPressItemExpendButton(ContentDto? content) {
    setState(() {
      if (content == null) {
        selectedContent = null;
      } else {
        selectedContent = content;
      }
    });
  }

  // P_TODO: 수정버튼 눌렀을 떄 구현해야 함.
  void onPressMoreEditButton(ContentDto? content) {
    selectedContent = content;
    String string = '${content?.content}';
    if (content?.tag?.name != null) string += ' #${content?.tag?.name}';
    bottomInputController.text = string;
    print("수정버튼 클릭 $string");
  }

  // 삭제버튼 눌렀을 떄
  void onPressMoreDeleteButton(ContentDto? content) {
    UtilHooks.useShowCustomDialog(
      context: context,
      title: '메모 삭제',
      content: '이 메모를 삭제할까요?',
      successButtonText: '확인',
      successButtonAction: () {
        if (content == null) return;
        ContentApi.delete(content.id!);
        pagingController.itemList = pagingController.itemList!
            .where((ele) => ele.id != content.id)
            .toList();
      },
    );
  }

  // P_TODO: 태그보기버튼 눌렀을 떄 구현해야 함.
  void onPressMoreTagViewButton(ContentDto? content) {
    print("태그보기버튼 클릭");
  }

  // P_TODO: 상단고정버튼 눌렀을 떄 구현해야 함.
  void onPressMorePinButton(ContentDto? content) {
    print("상단고정버튼 클릭");
  }

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      getContentInfinityScroll(pageKey);
    });
    // P_MEMO: 빌드가 끝나는 시점에 실행함.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setTagList();
    });
  }

  // @override
  // void didUpdateWidget(Widget oldWidget) {
  // }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var tagProvider = context.watch<TagProvider>();
    var colors = context.colors;
    var textStyle = context.textStyle;

    SingletonStorage storage = SingletonStorage();

    // tag Munu open, 추천태그 표시
    void onChangeTextInput(String text) => setState(() {
          isOpenTagMenu = text.isNotEmpty;

          // P_TODO: 태그 뽑는거 utils로 빼자.
          var arr = text.split('#');
          bool hasTag = arr.asMap().containsKey(1);
          String? tagName = hasTag ? arr[1] : null;
          if (tagName == null) return;

          TagDto? target = tagProvider.tagList
              .firstWhereOrNull((ele) => ele.name.contains(tagName));

          setState(() {
            searchedTag = target;
          });
        });

    // P_TODO: + 눌러서 저장.
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
          var contentDto = ContentDto(content: content, tagName: tagName);
          var newContent = await ContentApi.createMemo(contentDto);

          if (newContent != null) {
            pagingController.itemList?.insert(0, newContent);
          }
        } else {
          // P_TODO: 수정로직 수정해야함.
          var contentDto = ContentDto(
              content: content, tagName: tagName, id: selectedContent?.id);
          var updatedContent = await ContentApi.update(contentDto);

          if (updatedContent != null) {
            pagingController.itemList = pagingController.itemList
                ?.map((ele) =>
                    ele.id != selectedContent?.id ? ele : updatedContent)
                .toList();
          }
          selectedContent = null;
        }

        setState(() {
          bottomInputController.clear();
        });
        // P_TODO: toast 등 처리해야 함.
      } catch (err) {
        // P_TODO: 에러처리
      } finally {}
    }

    // tag button 클릭
    void onPressInputBoxTagItemButton(TagDto? tag) {
      var arr = bottomInputController.text.split('#');
      String newString = '${arr[0].trim()} #${tag?.name ?? ''}';
      bottomInputController.text = newString;
    }

    // untag / 삭제예정 변환 버튼
    void onPressItemUnTagButton(ContentDto content) {
      // P_TODO: 사용할지 말지 모름. 태그 변환.
      print('${content.id}');
    }

// P_MEMO: 눌렀을 때 input을 닫기 위함.
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CommonLayout(
        child: Scaffold(
          backgroundColor: colors.gray[100],
          // P_TODO: 이거 웹에서는 어떻게 나오는지 확인해야 함
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: CommonAppBar(
              iconButtonList: [
                AppBarIconButton(
                  routes: ROUTES.setting,
                  iconData: FontAwesomeIcons.gear,
                ),
                AppBarIconButton(
                  routes: ROUTES.tag,
                  iconData: FontAwesomeIcons.tag,
                )
              ],
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // P_TODO: pinn 항목이 들어갈 영역. 따로 API를 파야 하나?

              // P_MEMO: 아이템 영역
              Expanded(
                child: PagedListView<int, ContentDto>(
                  pagingController: pagingController, //저장했던 정보들
                  reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  builderDelegate: PagedChildBuilderDelegate<ContentDto>(
                    itemBuilder: (context, item, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      // P_TODO: 확장되면 태그가 여기로 나와야 함.
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
