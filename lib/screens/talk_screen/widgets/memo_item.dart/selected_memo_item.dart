import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/memo_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/more_button.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/tag_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/un_tag_button.dart';

class SelectedMemoItem extends MemoItem {
  const SelectedMemoItem({
    super.key,
    required super.content,
    required super.isSelected,
    required super.onPressItemMoreButton,
    required super.onPressItemUnTagButton,
  });

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: content.tag != null
              ? TagItem(
                  content: content,
                  isSelected: isSelected,
                )
              : UnTagButton(
                  content: content,
                  onPressItemUnTagButton: onPressItemUnTagButton,
                ),
        ),
        const SizedBox(
          height: 4,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 4,
            ),
            Expanded(
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
                      ),
                    ),
                    const SizedBox(width: 4),
                    // 더보기 버튼
                    MoreButton(
                      content: content,
                      onPressItemMoreButton: onPressItemMoreButton,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // 하단 날짜. 선택시에만 보여줄까?
        const SizedBox(height: 2),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            DateFormat("yy.MM.dd a hh:mm").format(
              DateTime.parse(
                content.updatedAt ?? '',
              ),
            ),
            style: textStyle.detail['md']?.copyWith(
              color: colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
