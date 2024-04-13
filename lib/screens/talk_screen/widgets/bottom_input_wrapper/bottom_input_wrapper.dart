import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/bottom_input_wrapper/widgets/botton_input.dart';

import 'package:memont_v2/screens/talk_screen/widgets/tag_button_item.dart';

import 'package:memont_v2/widgets/tag_button_list_wrapper.dart';
import 'package:provider/provider.dart';

class BottomInputWrapper extends StatelessWidget {
  const BottomInputWrapper({
    super.key,
    required this.isOpenTagMenu,
    required this.searchedTag,
    required this.onPressSaveMemoButton,
    required this.onChangeTextInput,
    required this.bottomInputController,
    required this.onPressInputBoxTagItemButton,
  });
  final bool isOpenTagMenu;
  final TagDto? searchedTag;
  final TextEditingController bottomInputController;
  final void Function() onPressSaveMemoButton;
  final void Function(String text) onChangeTextInput;
  final void Function(TagDto? tag) onPressInputBoxTagItemButton;

  // bool isToggleTagMenu = false;
  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var tagProvider = context.watch<TagProvider>();

    double deviceWidth = MediaQuery.of(context).size.width;
    double tagContainerWidth = deviceWidth - 100 - 60 - 16;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: colors.gray[700]!,
            blurStyle: BlurStyle.solid,
            blurRadius: 20,
            offset: const Offset(0.0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 32,
        ),
        child: Column(
          children: [
            if (isOpenTagMenu)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TagButtonListWrapper(
                    containerWidth: tagContainerWidth,
                    tagList: tagProvider.tagList,
                    onPressTagButton: onPressInputBoxTagItemButton,
                  ),

                  if (searchedTag != null)
                    TagButtonItem(
                      tag: searchedTag,
                      onPressTagButton: (TagDto? tag) =>
                          onPressInputBoxTagItemButton(tag),
                    ),

                  // 해시 아이콘
                  IconButton(
                    onPressed: () => onPressInputBoxTagItemButton(null),
                    padding: const EdgeInsets.all(8), // 패딩 설정
                    constraints: const BoxConstraints(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.white,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      elevation: 3,
                      shadowColor: colors.gray[100],
                    ),
                    icon: Icon(
                      size: 16,
                      FontAwesomeIcons.hashtag,
                      color: colors.gray[800],
                    ),
                  ),
                ],
              ),

            const SizedBox(
              height: 8,
            ),

            // 하단 인풋
            BottomInput(
              bottomInputController: bottomInputController,
              onChangeTextInput: onChangeTextInput,
              onPressSaveMemoButton: onPressSaveMemoButton,
            ),
          ],
        ),
      ),
    );
  }
}
