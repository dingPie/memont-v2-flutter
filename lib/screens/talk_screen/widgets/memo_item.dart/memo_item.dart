import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/models/content_dto/content_dto.dart';

import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/more_button.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/tag_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/un_tag_button.dart';

class MemoItem extends StatefulWidget {
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
  final void Function(ContentDto content, {bool isToBeDeleted})
      onPressMoreTagViewButton;
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
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Flex(
      direction: isExpended ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // P_MEMO: 이걸 왜 추가해서 된거지 ?
      children: [
        // 상단 태그항목
        Align(
          alignment: Alignment.centerLeft,
          child: widget.content.tag != null
              // P_TODO: 이건 공용으로 빼거나, 네이밍을 달리해야할듯. 아니면 import 에서 헷갈린다 .
              ? TagItem(
                  tag: widget.content.tag!,
                  isExpended: isExpended,
                )
              : UnTagButton(
                  content: widget.content,
                  onPressItemUnTagButton: widget.onPressItemUnTagButton,
                ),
        ),
        const SizedBox(height: 6, width: 8),

        Flexible(
          child: Column(
            children: [
              // 콘텐츠
              GestureDetector(
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
                      Expanded(
                        child: Text(
                          widget.content.content,
                          style: textStyle.body['md']?.copyWith(
                            color: colors.black,
                          ),
                          maxLines: isExpended ? 10 : 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      MoreButton(
                        content: widget.content,
                        onPressMoreEditButton: widget.onPressMoreEditButton,
                        onPressMoreDeleteButton: widget.onPressMoreDeleteButton,
                        onPressMoreTagViewButton:
                            widget.onPressMoreTagViewButton,
                        onPressMorePinButton: widget.onPressMorePinButton,
                      ),
                    ],
                  ),
                ),
              ),
              // 하단 날짜. 확장시에만 보여줌?
              const SizedBox(height: 4),
              if (isExpended)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    DateFormat("yy.MM.dd a hh:mm").format(
                      DateTime.parse(
                        widget.content.updatedAt ?? '',
                      ),
                    ),
                    style: textStyle.detail['md']?.copyWith(
                      color: colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
