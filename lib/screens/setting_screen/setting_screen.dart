import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import 'package:memont_v2/apis/user/user_api.dart';
import 'package:memont_v2/models/user_dto/user_dto.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/widgets/common_layout.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  UserDto? userInfo;

  void getMyInfo() async {
    var me = await UserApi.getMe();
    setState(() => userInfo = me);
  }

  @override
  void initState() {
    super.initState();
    getMyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CommonAppBar(
            iconButtonList: [
              AppBarIconButton(
                iconData: FontAwesomeIcons.reply,
              )
            ],
          ),
        ),
        body: Text(userInfo?.userName ?? ""),
      ),
    );
  }
}
