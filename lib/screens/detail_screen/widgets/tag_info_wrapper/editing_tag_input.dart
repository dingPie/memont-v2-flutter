import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class EditingTagInput extends StatelessWidget {
  const EditingTagInput({
    super.key,
    required this.textEditingController,
    required this.onPressConfirmEditTagButton,
    this.tagInfo,
  });

  final TextEditingController textEditingController;
  final TagDto? tagInfo;
  final void Function() onPressConfirmEditTagButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
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
          child: TextField(
            controller: textEditingController,
            style: textStyle.heading['sm'],
            decoration: InputDecoration(
              filled: true,
              fillColor: UtilMethod.hexToColor(tagInfo?.color),
              isDense: true, // text field 의 input을 조정하게 해줌
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: colors.gray[700]!,
                  width: 0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: colors.gray[700]!,
                  width: 0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 저장 버튼
            IconButton(
              onPressed: onPressConfirmEditTagButton,
              padding: const EdgeInsets.all(8), // 패딩 설정
              constraints: const BoxConstraints(), // constraints
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.white,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 2,
                shadowColor: colors.gray[100],
              ),
              icon: Icon(
                FontAwesomeIcons.check,
                size: 16,
                color: colors.gray[700],
              ),
            )
          ],
        )
      ],
    );
  }
}
