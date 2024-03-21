import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    this.tag,
    isToBeDeleted,
    this.onPressTagItem,
  }) : isToBeDeleted = isToBeDeleted ?? false;

  final TagDto? tag;
  final bool isToBeDeleted;
  final void Function(TagDto? tag)? onPressTagItem;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return GestureDetector(
      onTap: onPressTagItem != null ? () => onPressTagItem!(tag) : null,
      child: Container(
        decoration: BoxDecoration(
          color: tag != null
              ? UtilMethod.hexToColor(tag?.color)
              : isToBeDeleted == true
                  ? colors.gray[800]
                  : colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: colors.gray[300]!,
              blurStyle: BlurStyle.solid,
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          child: tag != null
              ? Text(
                  tag?.name ?? '#',
                  style: textStyle.heading['sm'],
                  overflow: TextOverflow.ellipsis,
                )
              : Row(
                  children: [
                    Icon(
                      size: 24,
                      isToBeDeleted == true
                          ? FontAwesomeIcons.stopwatch
                          : FontAwesomeIcons.hashtag,
                      color: isToBeDeleted == true
                          ? colors.white
                          : colors.gray[800],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
