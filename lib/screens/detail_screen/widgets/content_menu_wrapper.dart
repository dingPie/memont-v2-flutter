import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/widgets/tag_button_list_wrapper.dart';

class ContentMenuWrapper extends TagButtonListWrapper {
  ContentMenuWrapper({
    super.key,
    required this.onPressDeleteMemoButton,
    required super.tagList,
    required super.onPressTagButton,
    super.containerWidth,
  });
  final void Function() onPressDeleteMemoButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;

    return Container(
        height: 40,
        color: colors.primary[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TagButtonListWrapper(
              tagList: tagList,
              onPressTagButton: onPressTagButton,
            ),

            // 삭제버튼
            IconButton(
              padding: const EdgeInsets.all(6), // 패딩 설정
              constraints: const BoxConstraints(), // constraints
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.white,
              ),
              onPressed: onPressDeleteMemoButton,
              icon: Icon(
                FontAwesomeIcons.trash,
                size: 14,
                color: colors.gray[700],
              ),
            )
          ],
        ));
  }
}
