import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';

class BottomInput extends StatelessWidget {
  const BottomInput({
    super.key,
    required this.bottomInputController,
    required this.onChangeTextInput,
    required this.onPressSaveMemoButton,
  });

  final TextEditingController bottomInputController;
  final void Function(String text) onChangeTextInput;
  final void Function() onPressSaveMemoButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: null,
            controller: bottomInputController,
            onChanged: onChangeTextInput,
            style: textStyle.body['md'],
            decoration: InputDecoration(
              hintText: '내용과 #으로 태그를 붙여주세요.', // P_TODO: 첫번째 태그만 반영됨

              contentPadding: const EdgeInsets.all(12),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: colors.gray[300]!,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        // 추가버튼
        Container(
          width: 40,
          height: 40,
          constraints: const BoxConstraints(), // constraints
          decoration: BoxDecoration(
            border: Border.all(
              color: colors.gray[400]!,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0), // 패딩 설정
            constraints: const BoxConstraints(), // constraints
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.white,
            ),
            onPressed: onPressSaveMemoButton,
            icon: Icon(
              Icons.add,
              color: colors.gray[500],
            ),
          ),
        ),
      ],
    );
  }
}
