import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/apis/auth/auth_api.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/key.dart';

import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';
import 'package:memont_v2/models/login_dto/login_dto.dart';

import 'package:memont_v2/screens/login_screen/widgets/social_login_button.dart';
import 'package:memont_v2/widgets/common_layout.dart';

import 'package:memont_v2/widgets/pressable.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SingletonStorage storage = SingletonStorage();

    var appState = context.watch<AppState>();
    var colors = context.colors;
    var textStyle = context.textStyle;
    var authApi = AuthApi();

    void onPressSocialLoginButton(String snsType) async {
      LoginDto? body;

      try {
        if (snsType == 'google') {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          body = LoginDto(
            loginId: googleUser?.email ?? "",
            providerUid: googleUser?.id ?? "",
            fcmToken: 'fcmToken', // P_TODO: 이건 따로 가져오기 .
            userName: googleUser?.displayName ?? "",
            provider: 'google.com',
          );
        } else if (snsType == 'github') {
          GithubAuthProvider githubProvider = GithubAuthProvider();
          var githubAuth =
              await FirebaseAuth.instance.signInWithProvider(githubProvider);

          body = LoginDto(
            loginId: githubAuth.user?.email ?? "",
            providerUid: githubAuth.user?.uid ?? "",
            fcmToken: 'fcmToken', // P_TODO: 이건 따로 가져오기 .
            userName: githubAuth.user?.displayName ?? "",
            provider: githubAuth.user?.providerData[0].providerId ?? "",
          );
        }

        appState.isLoading = true;

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var res = await authApi.login(body!);
        storage.accessToken = res?.accessToken;
        await prefs.setString(KEY.REFRESH_TOKEN, res?.refreshToken ?? '');
        appState.isLogin = true;
      } catch (err) {
        print("로그인 이후 로직 에러 ${err.toString()}");
      } finally {
        appState.isLoading = false;
      }
    }

    void onPressPrivacyPolicyButton() {
      print('개인정보 처리방침 오픈');
    }

    return CommonLayout(
      child: Scaffold(
        backgroundColor: colors.primary[500],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MEMO'NT",
                  style: textStyle.display['md']?.copyWith(
                    color: colors.white,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                // 소셜로그인 버튼
                SocialLoginButton(
                  snsType: 'google',
                  text: 'Google로 시작하기',
                  onPressSocialLoginButton: onPressSocialLoginButton,
                  iconData: FontAwesomeIcons.google,
                  bgColor: colors.gray[200]!,
                  contentColor: colors.gray[800]!,
                ),
                const SizedBox(
                  height: 12,
                ),
                SocialLoginButton(
                  snsType: 'github',
                  text: 'Github로 시작하기',
                  onPressSocialLoginButton: onPressSocialLoginButton,
                  iconData: FontAwesomeIcons.github,
                  bgColor: colors.gray[800]!,
                  contentColor: colors.gray[200]!,
                ),

                const SizedBox(
                  height: 40,
                ),
                // 하단 설명 문구
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Pressable(
                      onPressed: onPressPrivacyPolicyButton,
                      child: Text(
                        '개인정보 처리방침',
                        style: textStyle.body['sm']!.copyWith(
                          color: colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '아이디, 이름을 제외한 개인정보는 저장되지 않습니다.',
                      style: textStyle.body['sm']!.copyWith(
                        color: colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '저장한 모든 메모는 안전하게 암호화 하여 저장됩니다.',
                      style: textStyle.body['sm']!.copyWith(
                        color: colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
