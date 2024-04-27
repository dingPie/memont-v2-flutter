import 'package:flutter/material.dart';

import 'package:memont_v2/models/content_dto/content_dto.dart';

import 'package:memont_v2/screens/talk_screen/widgets/pin_memo_item/widgets/pin_content_content.dart';
import 'package:memont_v2/screens/talk_screen/widgets/pin_memo_item/widgets/pin_content_controller.dart';
import 'package:memont_v2/screens/talk_screen/widgets/pin_memo_item/widgets/pin_tag_item.dart';

class PinMemoItem extends StatefulWidget {
  const PinMemoItem({
    super.key,
    required this.content,
    required this.onPressMoreTagViewButton,
    required this.onPressRemovePinContentButton,
  });

  final ContentDto content;
  final void Function(ContentDto content, {bool isToBeDeleted})
      onPressMoreTagViewButton;
  final void Function(ContentDto? content) onPressRemovePinContentButton;

  @override
  State<PinMemoItem> createState() => _PinMemoItemState();
}

class _PinMemoItemState extends State<PinMemoItem> {
  bool isExpended = false;
  int contentTextLine = 1;

  void onToggleExpended() {
    setState(() => isExpended = !isExpended);
  }

  @override
  void didUpdateWidget(PinMemoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    int lineNum = '\n'.allMatches(widget.content.content).length + 1;
    contentTextLine = lineNum > 4 ? 4 : lineNum;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: isExpended ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // P_MEMO: 이걸 왜 추가해서 된거지 ?
      children: [
        // 상단 태그항목
        Row(
          children: [
            PinTagItem(
              content: widget.content,
              isExpended: isExpended,
            ),
            //
            const SizedBox(width: 8),
            // 하나의 위젯으로 뺄것
            if (isExpended)
              PinContentController(
                content: widget.content,
                isExpended: isExpended,
                onPressMoreTagViewButton: widget.onPressMoreTagViewButton,
                onPressRemovePinContentButton:
                    widget.onPressRemovePinContentButton,
                onPressToggleExpendButton: onToggleExpended,
              ),
          ],
        ),
        const SizedBox(height: 8),

        PinContentContent(
          content: widget.content,
          isExpended: isExpended,
          contentTextLine: contentTextLine,
        ),

        const SizedBox(height: 0, width: 8),

        if (!isExpended)
          PinContentController(
            content: widget.content,
            isExpended: isExpended,
            onPressMoreTagViewButton: widget.onPressMoreTagViewButton,
            onPressRemovePinContentButton: widget.onPressRemovePinContentButton,
            onPressToggleExpendButton: onToggleExpended,
          ),
      ],
    );
  }
}
