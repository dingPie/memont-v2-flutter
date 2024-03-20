import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:memont_v2/apis/tag/tag_api.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';

import 'package:memont_v2/models/get_tag_dto/get_tag_dto.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/widgets/tag_item.dart';
import 'package:memont_v2/theme/color/app_colors_extension.dart';
import 'package:memont_v2/theme/textStyle/app_text_style_extension.dart';
import 'package:memont_v2/utils/util_hooks.dart';
import 'package:memont_v2/utils/util_method.dart';
import 'package:memont_v2/widgets/common_layout.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({
    super.key,
  });

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  final PagingController<int, TagDto> pagingController =
      PagingController(firstPageKey: 0);

  // 무한스크롤 형식으로 데이터 받이오기
  Future<void> getTagInfinityScroll(int pageKey) async {
    try {
      await Future.delayed(const Duration(microseconds: 500));
      GetTagDto getTagDto = GetTagDto(cursor: pageKey);
      var tagList = await TagApi.getListByCursor(getTagDto);
      if (tagList == null) throw '';

      bool isLast = tagList.cursor == null;
      if (isLast) {
        pagingController.appendLastPage(tagList.data);
      } else {
        pagingController.appendPage(tagList.data, tagList.cursor);
      }
    } catch (e) {
      if (!mounted) return;
      UtilHooks.useCustomToast(
        context: context,
        content: '태그 목록을 불러오는데에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
      );
      pagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      getTagInfinityScroll(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    void onPressTagItem(TagDto? tag, {bool isToBeDeleted = false}) {
      var tagId = isToBeDeleted
          ? 'isToBeDeleted'
          : tag == null
              ? '0'
              : tag.id.toString();
      var uri = Uri(
        path: '/detail/$tagId',
      ).toString();
      context.push(uri);
    }

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
                routes: ROUTES.talk,
                iconData: FontAwesomeIcons.solidMessage,
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TagItem(
                        onPressTagItem: onPressTagItem,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TagItem(
                        isToBeDeleted: true,
                        onPressTagItem: (tag) =>
                            onPressTagItem(tag, isToBeDeleted: true),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PagedGridView<int, TagDto>(
                  pagingController: pagingController,
                  // P_MEMO: grid는 이런 값으로 컨트롤한다.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 50,
                  ),

                  builderDelegate: PagedChildBuilderDelegate<TagDto>(
                    itemBuilder: (context, item, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 3, top: 3),
                        child: TagItem(
                          tag: item,
                          onPressTagItem: onPressTagItem,
                        ),
                      );
                    },
                  ),

                  // P_TODO: 맨 위 값 추가에 따라 수정될수도.
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
