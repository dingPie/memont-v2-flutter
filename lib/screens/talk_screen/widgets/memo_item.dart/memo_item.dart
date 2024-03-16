import 'package:flutter/material.dart';

import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/base_memo_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/expended_memo_item.dart';

class MemoItem extends StatefulWidget {
  // P_TODO: 이거 인자는 똑같이 받아서 import 해서 쓰고싶은데...
  const MemoItem({
    super.key,
    required this.content,
    required this.onPressItemUnTagButton,
    required this.onPressMoreEditButton,
    required this.onPressMoreDeleteButton,
    required this.onPressMoreTagViewButton,
    required this.onPressMorePinButton,
  });

  final ContentDto content;
  final void Function(List<int> idList) onPressItemUnTagButton;
  final void Function(ContentDto content) onPressMoreEditButton;
  final void Function(ContentDto content) onPressMoreDeleteButton;
  final void Function(ContentDto content) onPressMoreTagViewButton;
  final void Function(ContentDto content) onPressMorePinButton;

  @override
  State<MemoItem> createState() => _MemoItemState();
}

class _MemoItemState extends State<MemoItem> {
  bool isExpended = false;

  void onToggleExpended() {
    setState(() => isExpended = !isExpended);
  }

  @override
  Widget build(BuildContext context) {
    return isExpended == true
        ? ExpendedMemoItem(
            content: widget.content,
            isExpended: isExpended,
            onToggleExpended: onToggleExpended,
            onPressItemUnTagButton: widget.onPressItemUnTagButton,
            onPressMoreEditButton: widget.onPressMoreEditButton,
            onPressMoreDeleteButton: widget.onPressMoreDeleteButton,
            onPressMoreTagViewButton: widget.onPressMoreTagViewButton,
            onPressMorePinButton: widget.onPressMorePinButton,
          )
        : BaseMemoItem(
            content: widget.content,
            isExpended: isExpended,
            onToggleExpended: onToggleExpended,
            onPressItemUnTagButton: widget.onPressItemUnTagButton,
            onPressMoreEditButton: widget.onPressMoreEditButton,
            onPressMoreDeleteButton: widget.onPressMoreDeleteButton,
            onPressMoreTagViewButton: widget.onPressMoreTagViewButton,
            onPressMorePinButton: widget.onPressMorePinButton,
          );
  }
}
