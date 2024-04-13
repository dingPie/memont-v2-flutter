import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import 'package:memont_v2/apis/user/user_api.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/user_dto/user_dto.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/screens/setting_screen/widgets/set_delete_hour_wrapper.dart';
import 'package:memont_v2/screens/setting_screen/widgets/user_info_wrapper.dart';
import 'package:memont_v2/utils/util_hooks.dart';
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

  // 로그아웃 버튼
  void onPressLogoutButton() {
    // P_TODO: 로그아웃 처리, api 호출 등
    UtilHooks.useShowCustomDialog(
      context: context,
      title: '로그아웃',
      content: '현재 계정에서 로그아웃 할까요?',
      buttonList: [
        DialogButton(
          text: '로그아웃',
          onPress: () {
            // P_TODO: 로그아웃 로직 적용

            //   로그아웃 이후 띄워줌
            UtilHooks.useCustomToast(
              context: context,
              content: '로그아웃 되었습니다',
              toastType: ToastType.success,
            );
          },
        )
      ],
    );
  }

  void onSelectDeleteHour(int? hour) {
    // P_TODO: 시간 변경 이벤트 호출
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
                iconData: FontAwesomeIcons.reply,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              UserInfoWrapper(
                userInfo: userInfo,
                onPressLogoutButton: onPressLogoutButton,
              ),
              const SizedBox(height: 32),
              SetDeleteHourWrapper(
                userInfo: userInfo,
                onSelectDeleteHour: onSelectDeleteHour,
              )
            ],
          ),
        ),
      ),
    );
  }
}
