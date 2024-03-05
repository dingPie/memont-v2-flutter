import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.tag,
    required this.isExpended,
  });

  final TagDto tag;
  final bool isExpended;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Container(
      width: !isExpended ? 32 : null,
      height: !isExpended ? 32 : null,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: tag != null
            ? UtilMethod.hexToColor(
                tag.color,
              )
            : colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: colors.gray[300]!,
            blurStyle: BlurStyle.solid,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        tag.name,
        style: textStyle.body['md']?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
