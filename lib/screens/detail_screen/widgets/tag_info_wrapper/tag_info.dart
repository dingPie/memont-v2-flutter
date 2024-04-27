import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/widgets/more_item_popup_button.dart';
import 'package:memont_v2/utils/util_method.dart';
import 'package:memont_v2/widgets/tag_item.dart';

class TagInfo extends StatelessWidget {
  const TagInfo({
    super.key,
    this.tagInfo,
    required this.tagId,
    required this.onPressDeleteTagButton,
    required this.onPressChangeColorButton,
    required this.onPressEditTagButton,
  });

  final TagDto? tagInfo;
  final double tagId;
  final void Function() onPressDeleteTagButton;
  final void Function() onPressEditTagButton;
  final void Function() onPressChangeColorButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return PopupMenuButton<String>(
      itemBuilder: (BuildContext buildContext) {
        return [
          MoreItemPopupItem(
            icon: FontAwesomeIcons.trash,
            text: '삭제',
            onTapMoreItemPopupButton: onPressDeleteTagButton,
          ),
          if (tagId > 0) ...{
            MoreItemPopupItem(
              icon: FontAwesomeIcons.pen,
              text: '수정',
              onTapMoreItemPopupButton: onPressEditTagButton,
            ),
            MoreItemPopupItem(
              icon: FontAwesomeIcons.palette,
              text: '색상변경',
              onTapMoreItemPopupButton: onPressChangeColorButton,
            ),
          },
        ];
      },
      color: Colors.white,
      surfaceTintColor: colors.white, // P_MEMO: 둘다줘야함.
      elevation: 1,
      constraints: const BoxConstraints(minWidth: 0),
      position: PopupMenuPosition.under,
      offset: const Offset(10, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: UtilMethod.hexToColor(tagInfo?.color),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: colors.gray[300]!,
              blurStyle: BlurStyle.solid,
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: TagItem(
          tag: tagInfo,
          isToBeDeleted: tagId == -1,
        ),
      ),
    );
  }
}
