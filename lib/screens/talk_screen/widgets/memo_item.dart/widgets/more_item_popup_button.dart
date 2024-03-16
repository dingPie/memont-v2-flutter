import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';

class MoreItemPopupItem extends PopupMenuEntry<String> {
  const MoreItemPopupItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTapMoreItemPopupButton,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final void Function() onTapMoreItemPopupButton;

  @override
  bool represents(String? value) => false;

  @override
  MoreItemPopupItemState createState() => MoreItemPopupItemState();

  @override
  double get height => throw UnimplementedError();
}

class MoreItemPopupItemState extends State<MoreItemPopupItem> {
  @override
  Widget build(BuildContext context) {
    var textStyle = context.textStyle;
    return PopupMenuItem(
      onTap: () => widget.onTapMoreItemPopupButton(),
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            widget.icon,
            size: 16,
          ),
          Text(
            widget.text,
            style: textStyle.body['sm'],
          )
        ],
      ),
    );
  }
}
