import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({
    super.key,
    required this.content,
    required this.onPressDetailItem,
    required this.isEditing,
    required this.editTextController,
  });

  final ContentDto content;
  final bool isEditing;
  final TextEditingController editTextController;
  final void Function(ContentDto content) onPressDetailItem;

  @override
  State<DetailItem> createState() => _DetailItemState();
}

// 외부에서 주입하는 형식으로? 블러가 있나도 보자.

class _DetailItemState extends State<DetailItem> {
  // bool isEditing = false;
  // void onTest() {
  //   setState(() => isEditing = !isEditing);
  // }

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      print('포커스 확인  ${focusNode.hasFocus}');
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    if (widget.isEditing) {
      FocusScope.of(context).requestFocus(focusNode);
    }

    return GestureDetector(
      onTap: () => widget.onPressDetailItem(widget.content),
      child: Row(
        children: [
          //  P_TODO; if 문으로 조건 걸어서 두개 따로 처리해야힘.
          Expanded(
            child: widget.isEditing
                ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // P_TODO: controller
                      Positioned(
                        top: -40,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 450,
                          height: 40,
                          color: colors.primary[300],
                          child: const Text('여기 이제 삭제 등 컨트롤러가 들어올 듯'),
                        ),
                      ),
                      TextField(
                        focusNode: focusNode,
                        controller: widget.editTextController,
                        maxLines: null,
                        style: textStyle.body['sm'],
                        decoration: InputDecoration(
                          hintText: '내용을 입력해주세요.', // P_TODO: 첫번째 태그만 반영됨
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colors.gray[700]!,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: colors.gray[300] as Color,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.content.content,
                      style: textStyle.body['sm'],
                    ),
                  ),
          ),
          // Expanded(
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          //     decoration: BoxDecoration(
          //       border: Border(
          //         bottom: BorderSide(
          //           color: colors.gray[300] as Color,
          //           width: 1,
          //         ),
          //       ),
          //     ),
          //     child: Text(
          //       widget.content.content,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
