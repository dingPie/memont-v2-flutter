import 'package:flutter/material.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/detail_screen/tag_info_wrapper/editing_tag_input.dart';
import 'package:memont_v2/screens/detail_screen/tag_info_wrapper/tag_info.dart';

class TagInfoWrapper extends StatelessWidget {
  const TagInfoWrapper({
    super.key,
    this.tagInfo,
    required this.isEditingTag,
    required this.tagId,
    required this.textEditingController,
    required this.onPressDeleteTagButton,
    required this.onPressChangeColorButton,
    required this.onPressEditTagButton,
    required this.onPressConfirmEditTagButton,
  });

  final TextEditingController textEditingController;
  final TagDto? tagInfo;
  final double tagId;
  final bool isEditingTag;
  final void Function() onPressDeleteTagButton;
  final void Function() onPressEditTagButton;
  final void Function() onPressChangeColorButton;
  final void Function() onPressConfirmEditTagButton;

  @override
  Widget build(BuildContext context) {
    return !isEditingTag
        ? TagInfo(
            tagId: tagId,
            tagInfo: tagInfo,
            onPressDeleteTagButton: onPressDeleteTagButton,
            onPressChangeColorButton: onPressChangeColorButton,
            onPressEditTagButton: onPressEditTagButton,
          )
        : EditingTagInput(
            textEditingController: textEditingController,
            onPressConfirmEditTagButton: onPressConfirmEditTagButton,
          );
  }
}
