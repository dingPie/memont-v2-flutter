import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memont/apis/dio.dart';
import 'package:memont/config/build_context_extension.dart';
import 'package:memont/constants/routes.dart';

import 'package:memont/models/person/person.dart';

import 'package:memont/global_state/provider/user.dart';
import 'package:memont/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = context.watch<User>();
    var dio = DioIn().dio;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ROUTES.tag.name,
              style: context.textStyle.h1
                  .copyWith(fontSize: 40, color: context.colors.primary[500]),
            ),
          ],
        ),
      ),
    );
  }
}
