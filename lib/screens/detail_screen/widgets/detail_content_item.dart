import 'package:flutter/material.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/detail_screen/widgets/content_menu_wrapper.dart';

import 'package:provider/provider.dart';

class DetailContentItem extends StatefulWidget {
  const DetailContentItem({
    super.key,
    required this.content,
    required this.isEditing,
    required this.textEditingController,
    required this.onPressContentItem,
    required this.onPressDeleteMemoButton,
    required this.onPressContentTagButton,
  });

  final ContentDto content;
  final bool isEditing;
  final TextEditingController textEditingController;
  final void Function(ContentDto content) onPressContentItem;
  final void Function() onPressDeleteMemoButton;
  final void Function(TagDto? content) onPressContentTagButton;

  @override
  State<DetailContentItem> createState() => _DetailItemState();
}

// 외부에서 주입하는 형식으로? 블러가 있나도 보자.

class _DetailItemState extends State<DetailContentItem> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;
    TagProvider tagProvider = context.watch<TagProvider>();

    return Row(
      children: [
        Expanded(
          child: widget.isEditing
              // 수정중인 인풋 및 메뉴
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: () => widget.onPressContentItem(widget.content),
                      child: TextField(
                        controller: widget.textEditingController,
                        maxLines: null,
                        style: textStyle.body['sm'],
                        decoration: InputDecoration(
                          isDense: true, // text field 의 input을 조정하게 해줌
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 8),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colors.gray[700]!,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ContentMenuWrapper(
                      onPressDeleteMemoButton: widget.onPressDeleteMemoButton,
                      tagList: tagProvider.tagList,
                      onPressTagButton: widget.onPressContentTagButton,
                    ),
                  ],
                )
              // 일반 아이템
              : GestureDetector(
                  onTap: () => widget.onPressContentItem(widget.content),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colors.gray[300] as Color,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.content.content,
                      style: textStyle.body['sm'],
                    ),
                  ),
                ),
        ),
        // Expanded(
      ],
    );
  }
}
