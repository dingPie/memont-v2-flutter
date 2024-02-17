import 'package:flutter/material.dart';

class Pressable extends StatelessWidget {
  const Pressable({
    super.key,
    required this.child,
    required this.onPressed,
    this.align,
  });

  final Widget child;
  final AlignmentGeometry? align;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minimumSize: const Size.fromHeight(24),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Align(
        alignment: align ?? Alignment.centerLeft,
        child: child,
      ),
    );
  }
}
