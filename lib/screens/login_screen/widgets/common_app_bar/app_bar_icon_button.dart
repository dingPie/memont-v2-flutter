import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/routes.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.routes,
    required this.iconData,
  });

  final ROUTES routes;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;

    void onPressNavigationButton() {
      context.push(routes.path);
    }

    return IconButton(
      padding: const EdgeInsets.all(6), // 패딩 설정
      constraints: const BoxConstraints(), // constraints
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.white,
      ),
      onPressed: onPressNavigationButton,
      icon: Icon(iconData),
    );
  }
}
