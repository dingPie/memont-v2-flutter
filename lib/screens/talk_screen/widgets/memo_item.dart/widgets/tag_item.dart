import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.content,
    required this.isSelected,
  });

  final ContentDto content;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Container(
      width: !isSelected ? 28 : null,
      height: !isSelected ? 28 : null,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: content.tag != null
            ? UtilMethod.hexToColor(
                content.tag?.color,
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
        content.tag?.name ?? '',
        style: textStyle.body['md']?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
