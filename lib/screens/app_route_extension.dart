// const 처럼 사용되는 파일
// 추후 관리 방법에 대해서는 좀 더 고민이 필요할 듯.

enum ROUTE {
  home,
  detail,
  error,
  myPage,
}

extension AppRouteExtension on ROUTE {
  String get path {
    switch (this) {
      case ROUTE.home:
        return "/";
      case ROUTE.detail:
        return "detail/:id";
      case ROUTE.myPage:
        return "/myPage";
      case ROUTE.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get name {
    switch (this) {
      case ROUTE.home:
        return "HOME";
      case ROUTE.detail:
        return "HOME_DETAIL";
      case ROUTE.myPage:
        return "MY_PAGE";
      case ROUTE.error:
        return "ERROR";
      default:
        return "HOME";
    }
  }

  String get title {
    switch (this) {
      case ROUTE.home:
        return "홈페이지";
      case ROUTE.detail:
        return "디테일 페이지";
      case ROUTE.myPage:
        return "마이 페이지";
      case ROUTE.error:
        return "에러페이지";
      default:
        return "My App";
    }
  }
}
