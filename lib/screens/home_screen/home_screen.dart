import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_init/apis/dio.dart';
import 'package:flutter_init/config/build_context_extention.dart';
import 'package:flutter_init/constants/const_key.dart';
import 'package:flutter_init/providers/storage.dart';
import 'package:flutter_init/providers/user.dart';
import 'package:flutter_init/config/app_route_extension.dart';
import 'package:flutter_init/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = context.read<AppTheme>().themeMode;
    var user = context.watch<User>();

    void toggleThemeMode() {
      print('TEST: ${Storage.accessToken}');
      // read는 변경사항을 수신하진 않지만 값을 반환한고 (set 가능)
      // watch는 변경값을 수신만 한다 ? -> 한번 더 확인 필요
      if (context.read<AppTheme>().themeMode == ThemeMode.dark) {
        context.read<AppTheme>().themeMode = ThemeMode.light;
      } else {
        context.read<AppTheme>().themeMode = ThemeMode.dark;
      }
    }

    void onPressedRouteButton(String path) {
      context.push(Uri(
        path: path,
        // P_MEMO: 두 값이 엄연히 다르다.
        // queryParameters: {
        //   'query-param-id': Random().nextInt(10).toString(),
        // },
      ).toString());
    }

    void onPressLogin() => user.login(uid: '11', accessToken: '222');

    void onPressLogout() => user.logout();

    void test() async {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString(ConstKey.token, '테스트 문구입니다.');

      var dio = DioIn().dio;

      try {
        var result = await dio.get('/today');
        print('결과 확인! ${result.toString()}');
      } catch (err) {
        print('ERROR: ${err.toString()}');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray[200],
        title: Text(
          ROUTE.home.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOME SCREEN',
              style: context.textStyle.h1
                  .copyWith(fontSize: 40, color: context.colors.primary),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => onPressedRouteButton(
                        '/detail/${Random().nextInt(10).toString()}',
                      ),
                      child: const Text('DETAIL'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      onPressed: () => onPressedRouteButton(ROUTE.myPage.path),
                      child: const Text('MYPAGE'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: test,
                      child: Text(
                        '테스트     ',
                        style: context.textStyle.body1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onPressLogin,
                      child: Text(
                        '임시 로그인',
                        style: context.textStyle.body1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: onPressLogout,
                      child: Text(
                        '로그아웃',
                        style: context.textStyle.body1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleThemeMode,
        tooltip: 'toggle mode',
        child: Icon(
          themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }
}
