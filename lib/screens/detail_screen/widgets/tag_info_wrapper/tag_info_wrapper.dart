import 'package:flutter/material.dart';
import 'package:memont_v2/models/palette_dto.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/detail_screen/widgets/tag_info_wrapper/changing_tag_color_wrapper.dart';
import 'package:memont_v2/screens/detail_screen/widgets/tag_info_wrapper/editing_tag_input.dart';
import 'package:memont_v2/screens/detail_screen/widgets/tag_info_wrapper/tag_info.dart';

class TagInfoWrapper extends StatelessWidget {
  const TagInfoWrapper({
    super.key,
    this.tagInfo,
    required this.isEditingTag,
    required this.tagId,
    required this.textEditingController,
    this.selectedPalette,
    this.paletteList,
    required this.onPressDeleteTagButton,
    required this.onPressChangeColorButton,
    required this.onPressEditTagButton,
    required this.onPressConfirmEditTagButton,
    required this.onPressConfirmChangeColorButton,
    required this.onPressTagColorItem,
  });

  final TagDto? tagInfo;
  final double tagId;
  final bool isEditingTag;
  final TextEditingController textEditingController;
  final PaletteDto? selectedPalette;
  final List<PaletteDto>? paletteList;

  final void Function() onPressDeleteTagButton;
  final void Function() onPressEditTagButton;
  final void Function() onPressChangeColorButton;
  final void Function() onPressConfirmEditTagButton;
  final void Function(PaletteDto? palette) onPressTagColorItem;
  final void Function() onPressConfirmChangeColorButton;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isEditingTag) {
          return EditingTagInput(
            textEditingController: textEditingController,
            onPressConfirmEditTagButton: onPressConfirmEditTagButton,
          );
        }
        if (selectedPalette != null) {
          return ChangingTagColorWrapper(
            onPressConfirmChangeColorButton: onPressConfirmChangeColorButton,
            onPressTagColorItem: onPressTagColorItem,
            paletteList: paletteList,
            selectedPalette: selectedPalette,
            tagInfo: tagInfo,
          );
        }

        if (selectedPalette == null && !isEditingTag) {
          return TagInfo(
            tagId: tagId,
            tagInfo: tagInfo,
            onPressDeleteTagButton: onPressDeleteTagButton,
            onPressChangeColorButton: onPressChangeColorButton,
            onPressEditTagButton: onPressEditTagButton,
          );
        }

        return Text('');

        // return !isEditingTag
        //     ? TagInfo(
        //         tagId: tagId,
        //         tagInfo: tagInfo,
        //         onPressDeleteTagButton: onPressDeleteTagButton,
        //         onPressChangeColorButton: onPressChangeColorButton,
        //         onPressEditTagButton: onPressEditTagButton,
        //       )
        //     : EditingTagInput(
        //         textEditingController: textEditingController,
        //         onPressConfirmEditTagButton: onPressConfirmEditTagButton,
        //       );
      },
    );
  }
}
