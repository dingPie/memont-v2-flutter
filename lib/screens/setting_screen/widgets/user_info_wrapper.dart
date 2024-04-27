import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/user_dto/user_dto.dart';

class UserInfoWrapper extends StatelessWidget {
  const UserInfoWrapper({
    super.key,
    required this.userInfo,
    required this.onPressLogoutButton,
  });

  final UserDto? userInfo;
  final void Function() onPressLogoutButton;

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
              '연결된 계정',
              style: textStyle.heading['md'],
            ),
            ElevatedButton(
              onPressed: onPressLogoutButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary[500],
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 2,
                shadowColor: colors.gray[100],
              ),
              child: Text(
                '로그아웃',
                style: textStyle.body['md']?.copyWith(
                  color: colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: colors.gray[300]!,
                blurStyle: BlurStyle.solid,
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                userInfo?.userName ?? "",
                style: textStyle.body['lg']?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                userInfo?.loginId ?? "",
                style: textStyle.body['sm'],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            '${userInfo?.provider} 로 연결됨',
            style: textStyle.body['sm'],
          ),
        ),
      ],
    );
  }
}
