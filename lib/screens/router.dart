import 'package:memont/constants/routes.dart';
import 'package:memont/providers/user.dart';

import 'package:memont/screens/error_screen/error_screen.dart';
import 'package:memont/screens/login_screen/login_screen.dart';
import 'package:memont/screens/onboarding_screen/onboarding_screen.dart';
import 'package:memont/screens/tag_screen/tag_screen.dart';
import 'package:memont/screens/talk_screen/talk_screen.dart';
import 'package:memont/screens/detail_screen/detail_screen.dart';
import 'package:memont/screens/setting_screen/setting_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // auth guard 임시  처리를 위한 user 상태
  late User? user;
  AppRouter(
    this.user,
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
      bool isUnAuth = firstPath == ROUTES.login.path && !user!.isLogin;

      if (isUnAuth) {
        return ROUTES.login.path;
      }

      return null;
    }, // P_TODO: redirect 설정할 수 있음.
    // P_MEMO Provider로 제공받는 user 전역 상태를 보고있음. 다른 appState 같은걸 활용할 수 있다.
    refreshListenable: user,
    initialLocation: ROUTES.talk.path,
  );
}
