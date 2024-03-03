import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';

import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/more_button.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/tag_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/un_tag_button.dart';

class BaseMemoItem extends StatelessWidget {
  const BaseMemoItem({
    super.key,
    required this.content,
    required this.isExpended,
    required this.onToggleExpended,
    required this.onPressItemUnTagButton,
    required this.onPressMoreEditButton,
    required this.onPressMoreDeleteButton,
    required this.onPressMoreTagViewButton,
    required this.onPressMorePinButton,
  });

  // P_TODO: 하 이거 중복코드 못줄이나...
  final ContentDto content;
  final bool isExpended;
  final void Function() onToggleExpended;
  final void Function(ContentDto content) onPressItemUnTagButton;
  final void Function(ContentDto content) onPressMoreEditButton;
  final void Function(ContentDto content) onPressMoreDeleteButton;
  final void Function(ContentDto content) onPressMoreTagViewButton;
  final void Function(ContentDto content) onPressMorePinButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 태그 줄임표시 or 빈태그 표시
            Align(
              alignment: Alignment.centerLeft,
              child: content.tag != null
                  ? TagItem(
                      content: content,
                      isExpended: isExpended,
                    )
                  : UnTagButton(
                      content: content,
                      onPressItemUnTagButton: onPressItemUnTagButton,
                    ),
            ),

            const SizedBox(width: 4),
            // 전체박스
            Expanded(
              child: GestureDetector(
                onTap: () => onToggleExpended(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: colors.gray[200]!,
                        blurStyle: BlurStyle.solid,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // P_TODO: 아이템 UI. 그려야함.
                      Expanded(
                        child: Text(
                          content.content,
                          style: textStyle.body['md']?.copyWith(
                            color: colors.black,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),

                      MoreButton(
                        content: content,
                        onPressMoreEditButton: onPressMoreEditButton,
                        onPressMoreDeleteButton: onPressMoreDeleteButton,
                        onPressMoreTagViewButton: onPressMoreTagViewButton,
                        onPressMorePinButton: onPressMorePinButton,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        // P_TODO: 하단 날짜. 선택시에만 보여줄까?
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Text(
        //     DateFormat("yy.MM.dd a hh:mm").format(
        //       DateTime.parse(
        //         content.updatedAt ?? '',
        //       ),
        //     ),
        //     style: textStyle.detail['md']?.copyWith(
        //       color: colors.black,
        //     ),
        //     textAlign: TextAlign.right,
        //   ),
        // ),
      ],
    );
  }
}
