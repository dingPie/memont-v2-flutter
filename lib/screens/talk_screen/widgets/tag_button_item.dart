import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class TagButtonItem extends StatelessWidget {
  const TagButtonItem(
      {super.key,
      required this.tag,
      required this.onPressInputBoxTagItemButton});

  final TagDto? tag;
  final void Function(TagDto? tagDto) onPressInputBoxTagItemButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return SizedBox(
      height: 36,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 32),
        child: ElevatedButton(
          onPressed: () => onPressInputBoxTagItemButton(tag),
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(100, 32),
            minimumSize: const Size(40, 32),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            backgroundColor: tag != null
                ? UtilMethod.hexToColor(
                    tag?.color,
                  )
                : colors.white,
            elevation: 1,
          ),
          child: Text(
            tag?.name ?? '',
            style: textStyle.body['md']?.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.black,
            ),
            // textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
