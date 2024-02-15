import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';

import 'package:memont_v2/models/person/person.dart';

import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
