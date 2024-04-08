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
        height: 44,
        decoration: BoxDecoration(
          color: colors.gray[100],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: colors.gray[300]!,
              blurStyle: BlurStyle.solid,
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TagButtonListWrapper(
              tagList: tagList,
              onPressTagButton: onPressTagButton,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => onPressTagButton(null),
                  padding: const EdgeInsets.all(8), // 패딩 설정
                  constraints: const BoxConstraints(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.white,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 2,
                    shadowColor: colors.gray[100],
                  ),
                  icon: Icon(
                    size: 16,
                    FontAwesomeIcons.hashtag,
                    color: colors.gray[800],
                  ),
                ),
                const SizedBox(width: 8),
                // 삭제버튼
                IconButton(
                  onPressed: onPressDeleteMemoButton,
                  padding: const EdgeInsets.all(8), // 패딩 설정
                  constraints: const BoxConstraints(), // constraints
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.white,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 2,
                    shadowColor: colors.gray[100],
                  ),
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    size: 16,
                    color: colors.gray[700],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
