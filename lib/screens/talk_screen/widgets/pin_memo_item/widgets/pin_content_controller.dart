import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';

class PinContentController extends StatelessWidget {
  const PinContentController({
    super.key,
    required this.content,
    required this.isExpended,
    required this.onPressMoreTagViewButton,
    required this.onPressRemovePinContentButton,
    required this.onPressToggleExpendButton,
  });

  final ContentDto content;
  final bool isExpended;

  final void Function() onPressToggleExpendButton;
  final void Function(ContentDto content, {bool isToBeDeleted})
      onPressMoreTagViewButton;
  final void Function(ContentDto? content) onPressRemovePinContentButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors.white,
      ),
      child: Row(
        children: [
          if (isExpended)
            IconButton(
              onPressed: () => onPressMoreTagViewButton(content),
              icon: const Icon(FontAwesomeIcons.tag),
              color: colors.gray[800],
              iconSize: 22,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(6),
                backgroundColor: colors.white,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              constraints: const BoxConstraints(), // constraints
            ),
          if (isExpended)
            IconButton(
              onPressed: () {
                print('이거 안눌ㄹ림?');
                onPressRemovePinContentButton(null);
              },
              icon: const Icon(FontAwesomeIcons.trash),
              color: colors.gray[800],
              iconSize: 20,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(6),
                backgroundColor: colors.white,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              constraints: const BoxConstraints(), // constraints
            ),
          IconButton(
            onPressed: onPressToggleExpendButton,
            icon: Icon(isExpended
                ? FontAwesomeIcons.angleUp
                : FontAwesomeIcons.angleDown),
            color: colors.gray[800],
            iconSize: 22,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(6),
              backgroundColor: colors.white,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            constraints: const BoxConstraints(), // constraints
          ),
        ],
      ),
    );
  }
}
