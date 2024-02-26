import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.onPressItemMoreButton,
    required this.content,
  });

  final void Function(ContentDto content) onPressItemMoreButton;
  final ContentDto content;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        FontAwesomeIcons.ellipsis,
        size: 16,
      ),
      onPressed: () => onPressItemMoreButton(content),
      padding: const EdgeInsets.all(6), // 패딩 설정
      constraints: const BoxConstraints(),
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
