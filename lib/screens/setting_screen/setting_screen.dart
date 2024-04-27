import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import 'package:memont_v2/apis/user/user_api.dart';
import 'package:memont_v2/constants/key.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/global_state/provider/user_info_provider.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/screens/setting_screen/widgets/set_delete_hour_wrapper.dart';
import 'package:memont_v2/screens/setting_screen/widgets/user_info_wrapper.dart';
import 'package:memont_v2/utils/util_hooks.dart';
import 'package:memont_v2/widgets/common_layout.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SingletonStorage storage = SingletonStorage();
    var appState = context.watch<AppState>();
    var userInfo = context.watch<UserInfoProvider>().userInfo;

    //  시간 변경 이벤트
    void onSelectDeleteHour(int? hour) async {
      var updatedUserSetting =
          userInfo?.userSetting?.copyWith(deleteHour: hour);
      UserApi.updateSetting(updatedUserSetting!);

      userInfo = userInfo?.copyWith(userSetting: updatedUserSetting);
    }

    // 로그아웃 버튼 클릭
    void onPressLogoutButton() {
      UtilHooks.useShowCustomDialog(
        context: context,
        title: '로그아웃',
        content: '현재 계정에서 로그아웃 할까요?',
        buttonList: [
          DialogButton(
            text: '로그아웃',
            onPress: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

              storage.accessToken = null;
              prefs.remove(KEY.REFRESH_TOKEN);
              prefs.remove(KEY.PROVIDER_UID);

              appState.isLogin = false;
              if (!context.mounted) return;
              context.replace(ROUTES.login.path);
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
