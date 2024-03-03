import 'package:flutter/material.dart';

import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/base_memo_item.dart';
import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/selected_memo_item.dart';

class MemoItemCommon {
  final ContentDto content;
  final bool isExpended;
  final void Function() onToggleExpended;
  final void Function(ContentDto content) onPressItemUnTagButton;
  final void Function(ContentDto content) onPressMoreEditButton;
  final void Function(ContentDto content) onPressMoreDeleteButton;
  final void Function(ContentDto content) onPressMoreTagViewButton;
  final void Function(ContentDto content) onPressMorePinButton;

  MemoItemCommon({
    required this.content,
    required this.isExpended,
    required this.onToggleExpended,
    required this.onPressItemUnTagButton,
    required this.onPressMoreEditButton,
    required this.onPressMoreDeleteButton,
    required this.onPressMoreTagViewButton,
    required this.onPressMorePinButton,
  });
}

class MemoItem extends StatefulWidget {
  // P_TODO: 이거 인자는 똑같이 받아서 import 해서 쓰고싶은데...
  const MemoItem({
    super.key,
    required this.content,
    required this.onPressItemUnTagButton,
    required this.onPressMoreEditButton,
    required this.onPressMoreDeleteButton,
    required this.onPressMoreTagViewButton,
    required this.onPressMorePinButton,
  });

  final ContentDto content;
  final void Function(ContentDto content) onPressItemUnTagButton;
  final void Function(ContentDto content) onPressMoreEditButton;
  final void Function(ContentDto content) onPressMoreDeleteButton;
  final void Function(ContentDto content) onPressMoreTagViewButton;
  final void Function(ContentDto content) onPressMorePinButton;

  @override
  State<MemoItem> createState() => _MemoItemState();
}

class _MemoItemState extends State<MemoItem> {
  bool isExpended = false;

  void onToggleExpended() {
    setState(() => isExpended = !isExpended);
  }

  @override
  Widget build(BuildContext context) {
    return isExpended == true
        ? SelectedMemoItem(
            content: widget.content,
            isExpended: isExpended,
            onToggleExpended: onToggleExpended,
            onPressItemUnTagButton: widget.onPressItemUnTagButton,
            onPressMoreEditButton: widget.onPressMoreEditButton,
            onPressMoreDeleteButton: widget.onPressMoreDeleteButton,
            onPressMoreTagViewButton: widget.onPressMoreTagViewButton,
            onPressMorePinButton: widget.onPressMorePinButton,
          )
        : BaseMemoItem(
            content: widget.content,
            isExpended: isExpended,
            onToggleExpended: onToggleExpended,
            onPressItemUnTagButton: widget.onPressItemUnTagButton,
            onPressMoreEditButton: widget.onPressMoreEditButton,
            onPressMoreDeleteButton: widget.onPressMoreDeleteButton,
            onPressMoreTagViewButton: widget.onPressMoreTagViewButton,
            onPressMorePinButton: widget.onPressMorePinButton,
          );
  }
}


// import 'package:flutter/material.dart';

// import 'package:memont_v2/models/content_dto/content_dto.dart';
// import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/base_memo_item.dart';
// import 'package:memont_v2/screens/talk_screen/widgets/memo_item.dart/selected_memo_item.dart';

// interface class MemoItemInt {
//   const MemoItemInt({
//     required this.content,
//     required this.isSelected,
//     // required this.onPressItemMoreButton,
//     required this.onPressItemUnTagButton,
//     required this.onPressMoreEditButton,
//     required this.onPressMoreDeleteButton,
//     required this.onPressMoreTagViewButton,
//     required this.onPressMorePinButton,
//   });

//   final ContentDto content;
//   final bool isSelected;
//   // final void Function(ContentDto? content) onPressItemMoreButton;
//   final void Function(ContentDto content) onPressItemUnTagButton;

//   final void Function(ContentDto content) onPressMoreEditButton;
//   final void Function(ContentDto content) onPressMoreDeleteButton;
//   final void Function(ContentDto content) onPressMoreTagViewButton;
//   final void Function(ContentDto content) onPressMorePinButton;
// }

// class MemoItem extends StatelessWidget {
//   const MemoItem({
//     super.key,
//     required this.content,
//     required this.isSelected,
//     // required this.onPressItemMoreButton,
//     required this.onPressItemUnTagButton,
//     required this.onPressMoreEditButton,
//     required this.onPressMoreDeleteButton,
//     required this.onPressMoreTagViewButton,
//     required this.onPressMorePinButton,
//   });

//   final ContentDto content;
//   final bool isSelected;
//   // final void Function(ContentDto? content) onPressItemMoreButton;
//   final void Function(ContentDto content) onPressItemUnTagButton;

//   final void Function(ContentDto content) onPressMoreEditButton;
//   final void Function(ContentDto content) onPressMoreDeleteButton;
//   final void Function(ContentDto content) onPressMoreTagViewButton;
//   final void Function(ContentDto content) onPressMorePinButton;

//   @override
//   Widget build(BuildContext context) {
//     return isSelected == true
//         ? SelectedMemoItem(
//             content: content,
//             isSelected: isSelected,
//             // onPressItemMoreButton: onPressItemMoreButton,
//             onPressItemUnTagButton: onPressItemUnTagButton,
//             onPressMoreEditButton: onPressMoreEditButton,
//             onPressMoreDeleteButton: onPressMoreDeleteButton,
//             onPressMoreTagViewButton: onPressMoreTagViewButton,
//             onPressMorePinButton: onPressMorePinButton,
//           )
//         : BaseMemoItem(
//             content: content,
//             isSelected: isSelected,
//             // onPressItemMoreButton: onPressItemMoreButton,
//             onPressItemUnTagButton: onPressItemUnTagButton,
//             onPressMoreEditButton: onPressMoreEditButton,
//             onPressMoreDeleteButton: onPressMoreDeleteButton,
//             onPressMoreTagViewButton: onPressMoreTagViewButton,
//             onPressMorePinButton: onPressMorePinButton,
//           );
//   }
// }
