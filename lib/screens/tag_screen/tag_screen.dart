import 'package:flutter/material.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';

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
