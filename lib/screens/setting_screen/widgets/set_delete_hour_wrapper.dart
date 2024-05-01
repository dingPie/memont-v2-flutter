import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/user_dto/user_dto.dart';

const List<int> hourList = [
  1,
  2,
  3,
  4,
  5,
  6,
];

class SetDeleteHourWrapper extends StatelessWidget {
  const SetDeleteHourWrapper({
    super.key,
    required this.userInfo,
    required this.onSelectDeleteHour,
  });

  final UserDto? userInfo;
  final void Function(int? hour) onSelectDeleteHour;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '자동삭제 시간 설정',
              style: textStyle.heading['md'],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 8,
          children: [
            const Text('매일'),
            const SizedBox(width: 12),
            DropdownMenu<int>(
              onSelected: onSelectDeleteHour,
              inputDecorationTheme: InputDecorationTheme(
                fillColor: colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 16),
                constraints: BoxConstraints.tight(
                  const Size(150, 40),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              textStyle: textStyle.body['sm'],
              initialSelection: userInfo == null
                  ? hourList.first
                  : hourList
                      .where((ele) => ele == userInfo?.userSetting?.deleteHour)
                      .toList()[0],
              dropdownMenuEntries:
                  hourList.map<DropdownMenuEntry<int>>((int value) {
                return DropdownMenuEntry<int>(
                  value: value,
                  label: 'AM: 0${value}:00',
                  style:
                      ElevatedButton.styleFrom(backgroundColor: colors.white),
                );
              }).toList(),
            ),
            const Text('시에 '),
            const Text('삭제 예정 메모가'),
            const Text('삭제됩니다.'),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          '삭제가 진행되는 동안은 앱 이용이 불가능합니다.\n이용이 적은 시간대로 선택해주세요.',
          style: textStyle.detail['lg']?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
