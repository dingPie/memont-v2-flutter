enum ROUTES {
  onboarding(
    name: 'onboarding',
    path: '/onboarding',
  ),
  login(
    name: 'login',
    path: '/login',
  ),
  talk(
    name: 'talk',
    path: '/talk',
  ),
  tag(
    name: '태그 목록 페이지',
    path: '/tag',
  ),
  detail(
    // P_MEMO: home의 하위페이지로 설계되어 있어 /detail 처럼 설정하면 버그가 발생한다.
    name: '상세 페이지',
    path: '/detail/:id',
  ),
  setting(
    path: '/setting',
    name: '설정 페이지',
  ),
  deleting(
    path: '/deleting',
    name: '삭제중 안내 페이지',
  ),
  error(
    path: '/error',
    name: 'NOT FOUND',
  );

  final String path; // route 경로
  final String name;

  const ROUTES({
    required this.name,
    required this.path,
  });
}
