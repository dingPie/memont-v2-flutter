import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class PinTagItem extends StatelessWidget {
  const PinTagItem({
    super.key,
    required this.content,
    required this.isExpended,
  });

  final ContentDto content;
  final bool isExpended;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 250),
      width: !isExpended
          ? 32
          : MediaQuery.of(context).size.width - (44 * 3 + 8), //
      height: 32,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: content.tag != null
            ? UtilMethod.hexToColor(
                content.tag?.color,
              )
            : colors.white,
        borderRadius: BorderRadius.circular(isExpended ? 8 : 100),
      ),
      child: content.tag == null
          ? Icon(
              FontAwesomeIcons.hashtag,
              size: 16,
              color: colors.gray[800],
            )
          : Text(
              content.tag?.name ?? '',
              style: textStyle.body['md']?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
