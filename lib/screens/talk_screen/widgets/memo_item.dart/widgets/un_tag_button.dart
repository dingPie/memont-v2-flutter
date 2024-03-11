import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';

class UnTagButton extends StatelessWidget {
  const UnTagButton({
    super.key,
    required this.content,
    required this.onPressItemUnTagButton,
  });

  final void Function(List<int> idList) onPressItemUnTagButton;
  final ContentDto content;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colors.gray[200]!,
            blurStyle: BlurStyle.solid,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        // P_TODO: 현재는 한개씩 적용. 추후에는 api 호출 횟수 조절을 위해 debounce로 한번에 처리.
        onPressed: () => onPressItemUnTagButton([content.id!]),
        padding: const EdgeInsets.all(8), // 패딩 설정
        constraints: const BoxConstraints(),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              content.isToBeDeleted == true ? colors.gray[800] : colors.white,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: Icon(
          size: 16,
          content.isToBeDeleted == true
              ? FontAwesomeIcons.stopwatch
              : FontAwesomeIcons.hashtag,
          color:
              content.isToBeDeleted == true ? colors.white : colors.gray[800],
        ),
      ),
    );
  }
}
