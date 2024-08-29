import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/constants/key.dart';
import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/widgets/common_layout.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingItem {
  const OnboardingItem({
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;
}

// P_TODO: 나중에 이것도 따로 class로 빼야할듯
const List<OnboardingItem> list = [
  OnboardingItem(
    title: '톡 처럼 빠르게 메모하고',
    imageUrl: 'assets/image/sample.jpeg',
  ),
  OnboardingItem(
    title: '필요한 내용은 나중에 모아불 수 있어요',
    imageUrl: 'assets/image/sample.jpeg',
  ),
  OnboardingItem(
    title: '필요없는 내용이라면\n자동으로 지워줄거에요',
    imageUrl: 'assets/image/sample.jpeg',
  ),
];

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    var safePadding = MediaQuery.paddingOf(context);

    void onPressStartButton() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var isOnboarding = prefs.getBool(KEY.IS_ONBORDING);
      prefs.setBool(KEY.IS_ONBORDING, false);
      if (isOnboarding == false) {
        context.pop();
      } else {
        appState.isOnboarding = false;
      }
    }

    var colors = context.colors;
    var textStyle = context.textStyle;
    return CommonLayout(
      child: Scaffold(
        backgroundColor: colors.gray[100],
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height -
                    (safePadding.top + safePadding.bottom + 40),
                enableInfiniteScroll: false,
                viewportFraction: 1,
              ),
              items: list.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      color: colors.primary[100],
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: safePadding.top + 80,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.title,
                              style: textStyle.heading['sm'],
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // P_TODO: 여긴 이미지

                            Image.asset(
                              data.imageUrl,
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary[500],
                tapTargetSize: MaterialTapTargetSize.padded,
                fixedSize: Size(MediaQuery.of(context).size.width - 40, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onPressStartButton,
              child: Text(
                appState.isOnboarding == false ? '닫기' : '시작하기',
                style: textStyle.body['md']?.copyWith(
                  color: colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
