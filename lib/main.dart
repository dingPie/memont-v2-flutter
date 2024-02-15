import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memont_v2/config/firebase_options.dart';
import 'package:memont_v2/constants/key.dart';
import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/screens/router.dart';
import 'package:memont_v2/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var test = await prefs.getString(KEY.REFRESH_TOKEN);
  print('test ${test}');

  // P_TODO: 가능. splash 단에서 하거나, context 받아와서 하거나, 아무튼 방법 찾자.

  runApp(MyApp(
    isLogin: test != null,
  ));
}

// P_CHECK: final 써도 무방하지 않음?
final class MyApp extends StatelessWidget {
  bool isLogin = false;
  MyApp({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // P_TODO: 이거 자리잡으면 Global Provider로 뺴도 될듯
      providers: [
        // P_MEMO: Theme Provider
        ChangeNotifierProvider(
          create: (context) => AppTheme(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState(isLogin: isLogin),
        ),
      ],
      builder: (context, _) => MaterialApp.router(
        title: "MEMO'NT",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: AppRouter(context.watch<AppState>()).router,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
