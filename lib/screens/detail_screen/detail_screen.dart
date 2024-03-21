import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:memont_v2/apis/content/content_api.dart';
import 'package:memont_v2/apis/tag/tag_api.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/widgets/tag_item.dart';
import 'package:memont_v2/utils/util_hooks.dart';
import 'package:memont_v2/utils/util_method.dart';
import 'package:memont_v2/widgets/common_layout.dart';

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
  final PagingController<int, ContentDto> pagingController = // ContentDto
      PagingController(firstPageKey: 0);
  bool isNotTagged = false;

  TagDto? tagInfo;
  Future<void> getTagInfo() async {
    try {
      if (!isNotTagged) {
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
        tagId: isNotTagged ? null : int.tryParse(widget.tagId ?? ""),
        isNotTagged: isNotTagged,
        isToBeDeleted: widget.tagId == 'isToBeDeleted',
        // P_TODO: 이거 정렬 다르게 했을때 조회 이상 없을지 테스트해야함.
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
        content: '메모를 불러오는데에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
      );
      pagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();
    isNotTagged = widget.tagId == '0' || widget.tagId == 'isToBeDeleted';

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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // P_TODO: 최상단 제목. 클릭이벤트 넣어야함.
              Container(
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
                  isToBeDeleted: widget.tagId == 'isToBeDeleted',
                ),
              ),
              const SizedBox(
                height: 8,
              ),

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
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: PagedListView<int, ContentDto>(
                    pagingController: pagingController, //저장했던 정보들
                    builderDelegate: PagedChildBuilderDelegate<ContentDto>(
                      itemBuilder: (context, item, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 3, top: 3),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: colors.gray[300] as Color,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(item.content),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
