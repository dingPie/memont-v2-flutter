import 'package:flutter/material.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/widgets/common_layout.dart';

class DeletingScreen extends StatelessWidget {
  const DeletingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;
    return CommonLayout(
      child: Scaffold(
        backgroundColor: colors.primary[500],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '메모 삭제중...',
                  style: context.textStyle.title['sm']
                      ?.copyWith(color: colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircularProgressIndicator(),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '설정한 시간의 정시부터 10분간 이용이 불가능합니다.\n잠시후 다시 이용해주세요',
                  style: context.textStyle.body['lg']?.copyWith(
                    color: colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
