import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';

import 'package:memont_v2/models/person/person.dart';

import 'package:memont_v2/global_state/provider/user.dart';
import 'package:memont_v2/screens/login_screen/widgets/social_login_button.dart';
import 'package:memont_v2/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:memont_v2/theme/color/app_colors_extension.dart';
import 'package:memont_v2/theme/textStyle/app_text_style_extension.dart';
import 'package:memont_v2/widgets/presaable.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = context.watch<User>();
    var colors = context.colors;
    var textStyle = context.textStyle;

    void onPressSocialLoginButton(String snsType) async {
      if (snsType == 'google') {
        // P_TODO: 구글 로그인
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        print('GOOGLE AUTH: ${googleUser?.email} ${googleUser?.displayName}');

        // final GoogleSignInAuthentication? googleAuth =
        //     await googleUser?.authentication;
      } else if (snsType == 'github') {
        // P_TODO: 깃허브 로그인
      }
      print('$snsType');
    }

    void onPressPrivacyPolicyButton() {
      print('개인정보 처리방침 오픈');
    }

    return Scaffold(
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
                      style: textStyle.body['md']!.copyWith(
                        color: colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '2번 문구',
                    style: textStyle.body['md']!.copyWith(
                      color: colors.white,
                    ),
                  ),
                  Text(
                    '3번 문구',
                    style: textStyle.body['md']!.copyWith(
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
    );
  }
}
