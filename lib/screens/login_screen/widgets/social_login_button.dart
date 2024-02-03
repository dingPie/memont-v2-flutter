import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.snsType,
    required this.onPressSocialLoginButton,
    required this.text,
    required this.iconData,
    required this.bgColor,
    required this.contentColor,
  });

  final String snsType;
  final void Function(String string) onPressSocialLoginButton;
  final String text;
  final IconData iconData;
  final Color bgColor;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    var textStyle = context.textStyle;

    return ElevatedButton.icon(
      onPressed: () => onPressSocialLoginButton(snsType),
      icon: FaIcon(
        iconData,
        color: contentColor,
      ),
      label: Text(
        text,
        style: textStyle.body['md']!.copyWith(
          color: contentColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}
