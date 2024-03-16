import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/app_state.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onPressedBackButton() => context.pop();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray[200],
        title: Text(
          ROUTES.setting.name,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '마이페이지',
              style: context.textStyle.h1.copyWith(
                color: context.colors.primary[500],
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            ElevatedButton(
              onPressed: onPressedBackButton,
              child: const Text('뒤로가기'),
            )
          ],
        ),
      ),
    );
  }
}
