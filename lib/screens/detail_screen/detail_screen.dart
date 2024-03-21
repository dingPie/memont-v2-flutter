import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/apis/content/content_api.dart';
import 'package:memont_v2/apis/tag/tag_api.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';
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
  TagDto? tagInfo;
  Future<void> getTagInfo() async {
    // P_TODO: 각 항목 조회하는 이벤트 등 넣자..
    // P_TODO: 태그가 없을때도 생겨버렸음
    try {
      print('TAG ID ${widget.tagId}');
      var isNotTagged = widget.tagId != '0' && widget.tagId != 'isToBeDeleted';

      if (isNotTagged) {
        var tagData = await TagApi.getById(widget.tagId!);
        setState(() => tagInfo = tagData);
      }

      GetContentDto getTagDto = GetContentDto(
        cursor: 0,
        tagId: isNotTagged ? null : int.tryParse(widget.tagId ?? ""),
        isNotTagged: widget.tagId == '0',
        isToBeDeleted: widget.tagId == 'isToBeDeleted',
      );
      // // P_TODO: 이것도 커서페이지네이션 해야함.
      var test = await ContentApi.getListByCursor(getTagDto);

      print('결과보기!!! ${widget.tagId == '0'} ${test?.data.length}');

      // P_TODO: content만 조회하는 이벤트도 넣자ㅇㅇ
    } catch (e) {
      if (!mounted) return;
      UtilHooks.useCustomToast(
        context: context,
        content: '태그 목록을 불러오는데에 실패했습니다.', // P_TODO: 에러처리. 메세지보고 하자.
      );
    }
  }

  @override
  void initState() {
    super.initState();
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
            ],
          ),
        ),
      ),
    );
  }
}
