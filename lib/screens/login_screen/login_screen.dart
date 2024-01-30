import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont/apis/dio.dart';
import 'package:memont/config/build_context_extension.dart';
import 'package:memont/constants/routes.dart';

import 'package:memont/models/person/person.dart';

import 'package:memont/global_state/provider/user.dart';
import 'package:memont/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = context.watch<User>();
    var colors = context.colors;
    var textStyle = context.textStyle;

    void onPressSocialLoginButton(String snsType) {
      if (snsType == 'google') {
        // P_TODO: 구글 로그인
      } else if (snsType == 'github') {
        // 깃허브 로그인
      }
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
              ElevatedButton.icon(
                // P_TODO: 이게 null 이면 자동으로 disabled 상태가 됨
                onPressed: () => onPressSocialLoginButton('google'),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: colors.gray[600],
                ),
                label: Text(
                  'Google 로 시작하기',
                  style: textStyle.body['md']!.copyWith(
                    color: colors.gray[900],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: colors.gray[100],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                // P_TODO: 이게 null 이면 자동으로 disabled 상태가 됨
                onPressed: () => onPressSocialLoginButton('google'),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: colors.gray[100],
                ),
                label: Text(
                  'Github 로 시작하기',
                  style: textStyle.body['md']!.copyWith(
                    color: colors.gray[100],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: colors.gray[800],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // 하단 설명 문구
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '1번 문구',
                    style: textStyle.body['sm']!.copyWith(
                      color: colors.gray[100],
                    ),
                  ),
                  Text(
                    '2번 문구',
                    style: textStyle.body['sm']!.copyWith(
                      color: colors.gray[100],
                    ),
                  ),
                  Text(
                    '3번 문구',
                    style: textStyle.body['sm']!.copyWith(
                      color: colors.gray[100],
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
