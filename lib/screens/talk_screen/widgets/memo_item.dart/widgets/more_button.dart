import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/more_item_popup_button.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.content,
    required this.onPressMoreEditButton,
    required this.onPressMoreDeleteButton,
    required this.onPressMoreTagViewButton,
    required this.onPressMorePinButton,
  });

  final ContentDto content;
  final void Function(ContentDto content) onPressMoreEditButton;
  final void Function(ContentDto content) onPressMoreDeleteButton;
  final void Function(ContentDto content, {bool isToBeDeleted})
      onPressMoreTagViewButton;
  final void Function(ContentDto content) onPressMorePinButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return PopupMenuButton<String>(
      itemBuilder: (BuildContext buildContext) {
        return [
          MoreItemPopupItem(
            icon: FontAwesomeIcons.pen,
            text: '수정',
            onTapMoreItemPopupButton: () => onPressMoreEditButton(content),
          ),
          MoreItemPopupItem(
            icon: FontAwesomeIcons.trash,
            text: '삭제',
            onTapMoreItemPopupButton: () => onPressMoreDeleteButton(content),
          ),
          MoreItemPopupItem(
            icon: FontAwesomeIcons.tag,
            text: '태그보기',
            onTapMoreItemPopupButton: () => onPressMoreTagViewButton(
              content,
              isToBeDeleted: content.isToBeDeleted ?? false,
            ),
          ),
          if (content.isToBeDeleted == false)
            MoreItemPopupItem(
              icon: FontAwesomeIcons.thumbtack,
              text: '상단 고정',
              onTapMoreItemPopupButton: () => onPressMorePinButton(content),
            )
        ];
      },

      color: Colors.white,
      surfaceTintColor: colors.white, // P_MEMO: 둘다줘야함.
      elevation: 1,
      constraints: const BoxConstraints(minWidth: 0),

      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(
          FontAwesomeIcons.ellipsis,
          size: 16,
          color: colors.gray[800]!,
        ),
      ),
    );
  }
}
