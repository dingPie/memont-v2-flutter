import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memont/apis/common/palette_api.dart';
import 'package:memont/apis/dio.dart';
import 'package:memont/config/build_context_extension.dart';
import 'package:memont/constants/routes.dart';
import 'package:memont/global_state/singleton_storage.dart';
import 'package:memont/models/palette.dart';

import 'package:memont/models/person/person.dart';

import 'package:memont/global_state/provider/user.dart';
import 'package:memont/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TalkScreen extends StatelessWidget {
  const TalkScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = context.watch<User>();
    var paletteApi = PaletteApi();
    SingletonStorage storage = SingletonStorage();

    void onPressApiTestButton() async {
      try {
        storage.paletteList = await paletteApi.getPalette();

        print('여기서 결과 확인! ${storage.paletteList}');
      } catch (err) {
        print('여기서 해야됨? ${err.toString()}');
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ROUTES.talk.name,
              style: context.textStyle.h1.copyWith(
                fontSize: 40,
                color: context.colors.primary[500],
              ),
            ),
            ElevatedButton(
              onPressed: onPressApiTestButton,
              child: const Text("API TEST"),
            )
          ],
        ),
      ),
    );
  }
}
