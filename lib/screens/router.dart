import 'package:flutter_init/providers/user.dart';
import 'package:flutter_init/config/app_route_extension.dart';
import 'package:flutter_init/screens/error_screen/error_screen.dart';
import 'package:flutter_init/screens/home_screen/home_screen.dart';
import 'package:flutter_init/screens/detail_screen/detail_screen.dart';
import 'package:flutter_init/screens/my_page_screen/my_page_screen.dart';
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
        path: ROUTE.home.path,
        name: ROUTE.home.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: ROUTE.detail.path,
            name: ROUTE.detail.name,
            builder: (context, state) {
              return DetailScreen(
                goRouterState: state,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: ROUTE.myPage.path,
        name: ROUTE.myPage.name,
        builder: (context, state) => const MyPageScreen(),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(
      goRouterState: state,
    ),
    redirect: (context, state) {
      String firstPath =
          state.uri.pathSegments.isNotEmpty ? state.uri.pathSegments[0] : '';
      // P_TODO: auth / unAuth 에 대한 규칙 세워야 함.
      if (firstPath == 'myPage' && !user!.isLogin) {
        print('auth guard!');
        return '/';
      }

      return null;
    }, // P_TODO: redirect 설정할 수 있음.
    // P_MEMO Provider로 제공받는 user 전역 상태를 보고있음. 다른 appState 같은걸 활용할 수 있다.
    refreshListenable: user,
    initialLocation: ROUTE.home.path,
  );
}
