import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';

class PinContentContent extends StatelessWidget {
  const PinContentContent({
    super.key,
    required this.isExpended,
    required this.content,
    required this.contentTextLine,
  });

  final bool isExpended;
  final ContentDto content;
  final int contentTextLine;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        // P_MEMO: row 방향으로 양 옆을 다 채우려는 속성 때문에 가능
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              height: isExpended ? (contentTextLine * 23) : 23,
              constraints: const BoxConstraints(maxHeight: 92),
              child: SingleChildScrollView(
                physics: isExpended
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Text(
                  content.content,
                  style: textStyle.body['md']?.copyWith(
                    color: colors.black,
                  ),
                  maxLines: isExpended ? 10 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
