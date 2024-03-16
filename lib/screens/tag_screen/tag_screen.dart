import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/widgets/common_layout.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CommonAppBar(
            iconButtonList: [
              AppBarIconButton(
                routes: ROUTES.setting,
                iconData: FontAwesomeIcons.gear,
              ),
              AppBarIconButton(
                routes: ROUTES.talk,
                iconData: FontAwesomeIcons.solidMessage,
              )
            ],
          ),
        ),
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
      ),
    );
  }
}
