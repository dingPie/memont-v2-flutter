import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/widgets/presaable.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    required this.iconButtonList,
  });

  final List<AppBarIconButton> iconButtonList;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return AppBar(
      centerTitle: false,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 8,
        ),
        child: Pressable(
          onPressed: () => context.go(ROUTES.talk.path),
          child: Text(
            "MEMO'NT",
            style: textStyle.heading['lg']?.copyWith(
              color: colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: colors.primary[500],
      actionsIconTheme: IconThemeData(
        color: colors.primary[500],
        size: 20,
      ),
      actions: [
        for (var iconButton in iconButtonList) iconButton,
      ],
    );
  }
}
