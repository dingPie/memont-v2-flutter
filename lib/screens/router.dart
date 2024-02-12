import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/user_state.dart';

import 'package:memont_v2/screens/error_screen/error_screen.dart';
import 'package:memont_v2/screens/login_screen/login_screen.dart';
import 'package:memont_v2/screens/onboarding_screen/onboarding_screen.dart';
import 'package:memont_v2/screens/tag_screen/tag_screen.dart';
import 'package:memont_v2/screens/talk_screen/talk_screen.dart';
import 'package:memont_v2/screens/detail_screen/detail_screen.dart';
import 'package:memont_v2/screens/setting_screen/setting_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // auth guard 임시  처리를 위한 user 상태
  late UserState? userState;
  AppRouter(
    this.userState,
  );

  GoRouter get router => _goRouter;

  late final _goRouter = GoRouter(
    routes: [
      GoRoute(
        path: ROUTES.talk.path,
        name: ROUTES.talk.name,
        builder: (context, state) => const TalkScreen(),
      ),
      GoRoute(
        path: ROUTES.tag.path,
        name: ROUTES.tag.name,
        builder: (context, state) => const TagScreen(),
      ),
      GoRoute(
        path: ROUTES.detail.path,
        name: ROUTES.detail.name,
        builder: (context, state) => DetailScreen(
          goRouterState: state,
        ),
      ),
      GoRoute(
        path: ROUTES.setting.path,
        name: ROUTES.setting.name,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: ROUTES.onboarding.path,
        name: ROUTES.onboarding.name,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: ROUTES.login.path,
        name: ROUTES.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(
      goRouterState: state,
    ),
    redirect: (context, state) {
      String firstPath =
          state.uri.pathSegments.isNotEmpty ? "${state.uri}" : '';
      bool isUnAuth = (firstPath != ROUTES.login.path ||
              firstPath != ROUTES.onboarding.path) &&
          !userState!.isLogin;

      if (isUnAuth) {
        return ROUTES.login.path;
      }

      return null;
    }, // P_TODO: redirect 설정할 수 있음.
    // P_MEMO Provider로 제공받는 userState 전역 상태를 보고있음. 다른 appState 같은걸 활용할 수 있다.
    refreshListenable: userState,
    initialLocation: ROUTES.talk.path,
  );
}
