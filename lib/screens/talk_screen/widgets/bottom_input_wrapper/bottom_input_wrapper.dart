import 'package:flutter/material.dart';

import 'package:memont_v2/config/build_context_extension.dart';

class BottomInputWrapper extends StatefulWidget {
  const BottomInputWrapper({
    super.key,
    required this.onPressSaveMemoButton,
    required this.onChangeTextInput,
  });

  final void Function() onPressSaveMemoButton;
  final void Function(String text) onChangeTextInput;

  @override
  State<BottomInputWrapper> createState() => _BottomInputWrapperState();
}

class _BottomInputWrapperState extends State<BottomInputWrapper> {
  bool isToggleTagMenu = false;

  void onOpenTagMenu() {
    setState(() => isToggleTagMenu = true);
  }

  void onCloseTagMenu() {
    setState(() => isToggleTagMenu = false);
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;

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
            // P_TODO: 태그 목록 렌더링
            if (isToggleTagMenu) const Text('여기 이제 태그 목록들이 들어갈것임'),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: widget.onChangeTextInput,
                    onTap: onOpenTagMenu,
                    onTapOutside: (PointerDownEvent event) => onCloseTagMenu(),
                    decoration: InputDecoration(
                      hintText: '내용과 #으로 태그를 붙여주세요',
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
                    onPressed: widget.onPressSaveMemoButton,
                    icon: Icon(
                      Icons.add,
                      color: colors.gray[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
