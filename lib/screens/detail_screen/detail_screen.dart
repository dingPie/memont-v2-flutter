import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/apis/tag/tag_api.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
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
    try {
      var tagData = await TagApi.getById(widget.tagId!);
      setState(() => tagInfo = tagData);
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
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    tagInfo?.name ?? '',
                    style: textStyle.heading['sm'],
                    overflow: TextOverflow.ellipsis,
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
