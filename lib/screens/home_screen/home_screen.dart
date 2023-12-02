import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_init/config/build_context_extention.dart';
import 'package:flutter_init/providers/user.dart';
import 'package:flutter_init/screens/app_route_extension.dart';
import 'package:flutter_init/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = context.watch<AppTheme>().themeMode;
    var user = context.watch<User>();

    void toggleThemeMode() {
      print('test ${themeMode.name}');
      if (themeMode == ThemeMode.dark) {
        themeMode = ThemeMode.light;
      } else {
        themeMode = ThemeMode.dark;
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

    void onPressLogin() => user.login('11');

    void onPressLogout() => user.logout();

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
              style: context.textStyle.h1.copyWith(
                fontSize: 40,
              ),
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
