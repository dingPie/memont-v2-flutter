import 'package:flutter/material.dart';

import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/base_memo_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/selected_memo_item.dart';

class MemoItem extends StatelessWidget {
  const MemoItem({
    super.key,
    required this.content,
    required this.isSelected,
    required this.onPressItemMoreButton,
    required this.onPressItemUnTagButton,
  });

  final ContentDto content;
  final bool isSelected;
  final void Function(ContentDto content) onPressItemMoreButton;
  final void Function(ContentDto content) onPressItemUnTagButton;

  @override
  Widget build(BuildContext context) {
    return isSelected == true
        ? SelectedMemoItem(
            content: content,
            isSelected: isSelected,
            onPressItemMoreButton: onPressItemMoreButton,
            onPressItemUnTagButton: onPressItemUnTagButton,
          )
        : BaseMemoItem(
            content: content,
            isSelected: isSelected,
            onPressItemMoreButton: onPressItemMoreButton,
            onPressItemUnTagButton: onPressItemUnTagButton,
          );
  }
}
