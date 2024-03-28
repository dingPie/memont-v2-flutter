import 'package:flutter/material.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/tag_button_item.dart';

class TagButtonListWrapper extends StatelessWidget {
  const TagButtonListWrapper({
    super.key,
    required this.tagList,
    required this.onPressTagButton,
    containerWidth,
  }) : containerWidth = containerWidth ?? 200;

  final double? containerWidth;
  final List<TagDto> tagList;
  final void Function(TagDto? tag) onPressTagButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: containerWidth,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 4),
        itemBuilder: (BuildContext context, int index) => TagButtonItem(
          tag: tagList[index],
          onPressTagButton: (TagDto? tag) => onPressTagButton(tag),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
