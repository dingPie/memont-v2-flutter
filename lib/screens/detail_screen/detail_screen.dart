import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:memont_v2/apis/content/content_api.dart';
import 'package:memont_v2/apis/tag/tag_api.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/delete_tag_dto/delete_tag_dto.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/detail_screen/widgets/detail_content_item.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/screens/tag_screen/tag_screen.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/more_item_popup_button.dart';
import 'package:memont_v2/widgets/tag_item.dart';
import 'package:memont_v2/utils/util_hooks.dart';
import 'package:memont_v2/utils/util_method.dart';
import 'package:memont_v2/widgets/common_layout.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    this.tagId,
  });

  final String? tagId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PagingController<int, ContentDto> pagingController =
      PagingController(firstPageKey: 0);
  double tagId = 0;

  TextEditingController editTextController = TextEditingController();
  ContentDto? selectedContent;

  TagDto? tagInfo;
  Future<void> getTagInfo() async {
    try {
      if (tagId > 0) {
        var tagData = await TagApi.getById(widget.tagId!);
        setState(() => tagInfo = tagData);
      }
    } catch (e) {
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

      GetContentDto getContentDto = GetContentDto(
        cursor: pageKey,
        tagId: tagId < 1 ? null : int.tryParse(widget.tagId ?? ""),
        isNotTagged: tagId < 1,
        isToBeDeleted: widget.tagId == '-1',
        sort: "ASC",
      );

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
        content: '메모를 불러오는데에 실패했습니다.',
      );
      pagingController.error = e;
    }
  }

  // 태그 삭제 삭제
  void onPressDeleteTagButton() {
    String content = tagId < 1
        ? '태그가 없는 항목들은 현재 메모만 삭제됩니다.'
        : '이 태그를 삭제할까요? 태그만 삭제 선택시, 메모들은 빈 태그로 변경 됩니다.';
    UtilHooks.useShowCustomDialog(
      context: context,
      title: '태그 삭제',
      content: content,
      buttonList: [
        if (tagId < 1) ...{
          DialogButton(
            text: '메모 전체 삭제',
            onPress: () async {
              try {
                await TagApi.delete(
                  DeleteTagDto(
                    id: tagId,
                    isToBeDeleted: widget.tagId == '-1',
                  ),
                );
                if (!context.mounted) return;
                UtilHooks.useCustomToast(
                  context: context,
                  content: '관련 메모가 모두 삭제 되었습니다.',
                  toastType: ToastType.success,
                );
                context.pop();
              } catch (err) {
                UtilHooks.useCustomToast(
                  context: context,
                  content: '태그 삭제에 실패했습니다.',
                );
              }
            },
          )
        } else ...{
          DialogButton(
            text: '태그만 삭제',
            onPress: () async {
              try {
                await TagApi.delete(
                  DeleteTagDto(
                    id: tagId,
                    isDeleteWithContent: false,
                  ),
                );
                if (!context.mounted) return;
                UtilHooks.useCustomToast(
                  context: context,
                  content: '해당 태그만 삭제 되었습니다.',
                  toastType: ToastType.success,
                );
                context.pop();
              } catch (err) {
                UtilHooks.useCustomToast(
                  context: context,
                  content: '태그 삭제에 실패했습니다.',
                );
              }
            },
          ),
          DialogButton(
            text: '메모까지 삭제',
            onPress: () async {
              try {
                await TagApi.delete(
                  DeleteTagDto(
                    id: tagId,
                    isDeleteWithContent: true,
                  ),
                );
                if (!context.mounted) return;
                UtilHooks.useCustomToast(
                  context: context,
                  content: '해당 태그 및 콘텐츠가 모두 삭제 되었습니다.',
                  toastType: ToastType.success,
                );
                context.pop();
              } catch (err) {
                UtilHooks.useCustomToast(
                  context: context,
                  content: '태그 삭제에 실패했습니다.',
                );
              }
            },
          ),
        }
      ],
    );
  }

  // 콘텐츠 클릭, 선택항목 선택 및 이전 항목 저장
  void onPressDetailItem(ContentDto? content) async {
    if (selectedContent != null &&
        selectedContent!.content != editTextController.text) {
      ContentDto editedContent = selectedContent!.copyWith(
        content: editTextController.text,
      );
      ContentApi.update(editedContent);
      pagingController.itemList = pagingController.itemList
          ?.map(
            (ele) => selectedContent?.id != ele.id ? ele : editedContent,
          )
          .toList();
    }
    setState(() => selectedContent = content);
    editTextController.text = content?.content ?? '';
  }

  // 콘텐츠 삭제
  void onPressDeleteMemoButton() {
    UtilHooks.useShowCustomDialog(
      context: context,
      title: '메모 삭제',
      content: '이 메모를 삭제할까요?',
      buttonList: [
        DialogButton(
          text: '확인',
          onPress: () {
            if (selectedContent == null) return;
            ContentApi.delete(selectedContent?.id ?? 0);
            pagingController.itemList = pagingController.itemList!
                .where((ele) => ele.id != selectedContent?.id)
                .toList();
          },
        )
      ],
    );
  }

  // 해당 콘텐츠 태그변경
  void onPressContentTagButton(TagDto? tag) {
    UtilHooks.useShowCustomDialog(
      context: context,
      title: '태그 변경',
      content: '이 메모의 태그를 변경할까요?',
      buttonList: [
        DialogButton(
          text: '확인',
          onPress: () {
            if (selectedContent == null) return;
            ContentDto editedContent = selectedContent!.copyWith(
              tagId: tag?.id,
            );
            ContentApi.update(editedContent);
            pagingController.itemList = pagingController.itemList!
                .where((ele) => ele.id != selectedContent?.id)
                .toList();
            selectedContent = null;
          },
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tagId = double.parse(widget.tagId ?? '');

    pagingController.addPageRequestListener((pageKey) {
      getContentInfinityScroll(pageKey);
    });
    getTagInfo();
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return CommonLayout(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CommonAppBar(
            iconButtonList: [
              AppBarIconButton(
                routes: ROUTES.setting,
                iconData: FontAwesomeIcons.gear,
              ),
              AppBarIconButton(
                iconData: FontAwesomeIcons.reply,
              )
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () => onPressDetailItem(null),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // P_TODO: 최상단 제목. 클릭이벤트 넣어야함.
                PopupMenuButton<String>(
                  itemBuilder: (BuildContext buildContext) {
                    return [
                      MoreItemPopupItem(
                        icon: FontAwesomeIcons.trash,
                        text: '삭제',
                        onTapMoreItemPopupButton: onPressDeleteTagButton,
                      ),
                      // P_TODO: tagId가 있을떄만
                      MoreItemPopupItem(
                        icon: FontAwesomeIcons.pen,
                        text: '수정',
                        onTapMoreItemPopupButton: () => print('test'),
                      ),
                      // P_TODO: tagId가 있을떄만
                      MoreItemPopupItem(
                        icon: FontAwesomeIcons.palette,
                        text: '색상변경',
                        onTapMoreItemPopupButton: () => print('test'),
                      ),
                      // P_TODO: 아이콘이랑 텍스트. 수정, 삭제 상단 고정, 모아보기
                      // P_TODO: 최소값이 줄어들질 않네...
                    ];
                  },

                  color: Colors.white,
                  surfaceTintColor: colors.white, // P_MEMO: 둘다줘야함.
                  elevation: 1,
                  constraints: const BoxConstraints(minWidth: 0),
                  position: PopupMenuPosition.under,
                  offset: Offset(10, 0),

                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: UtilMethod.hexToColor(tagInfo?.color),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: colors.gray[300]!,
                          blurStyle: BlurStyle.solid,
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: TagItem(
                      tag: tagInfo,
                      isToBeDeleted: widget.tagId == '-1',
                    ),
                  ),
                ),
                // P_TODO:TEST
                // Container(
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: UtilMethod.hexToColor(tagInfo?.color),
                //     borderRadius: BorderRadius.circular(8),
                //     boxShadow: [
                //       BoxShadow(
                //         color: colors.gray[300]!,
                //         blurStyle: BlurStyle.solid,
                //         blurRadius: 20,
                //         offset: const Offset(0, 8),
                //       ),
                //     ],
                //   ),
                //   child: TagItem(
                //     tag: tagInfo,
                //     isToBeDeleted: widget.tagId == '-1',
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),

                // 중단  메모들
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: colors.gray[300] as Color,
                          blurStyle: BlurStyle.solid,
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.none,
                    child: PagedListView<int, ContentDto>(
                      pagingController: pagingController, //저장했던 정보들
                      builderDelegate: PagedChildBuilderDelegate<ContentDto>(
                        itemBuilder: (context, item, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 3, top: 3),
                            child: DetailContentItem(
                              content: item,
                              isEditing: selectedContent?.id == item.id,
                              editTextController: editTextController,
                              onPressDetailItem: onPressDetailItem,
                              onPressDeleteMemoButton: onPressDeleteMemoButton,
                              onPressContentTagButton: onPressContentTagButton,
                            )),
                      ),
                    ),
                  ),
                ),

                // P_TODO:  맨 아래 추가로 쓸 수 있는 칸도 일단 있어야 해./..
              ],
            ),
          ),
        ),
      ),
    );
  }
}
