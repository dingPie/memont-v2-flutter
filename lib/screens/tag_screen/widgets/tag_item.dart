import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.tag,
    required this.onPressTagItem,
  });

  final TagDto tag;
  final void Function(TagDto tag) onPressTagItem;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return GestureDetector(
      onTap: () => onPressTagItem(tag),
      child: Container(
        decoration: BoxDecoration(
          color: UtilMethod.hexToColor(tag.color),
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
          padding: const EdgeInsets.all(8),
          child: Text(
            tag.name,
            style: textStyle.heading['sm'],
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
