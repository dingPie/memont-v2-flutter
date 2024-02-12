import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memont_v2/config/firebase_options.dart';
import 'package:memont_v2/global_state/provider/user_state.dart';
import 'package:memont_v2/screens/router.dart';
import 'package:memont_v2/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// P_CHECK: final 써도 무방하지 않음?
final class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          create: (context) => UserState(),
        ),
      ],
      builder: (context, _) => MaterialApp.router(
        title: "MEMO'NT",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: AppRouter(context.watch<UserState>()).router,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
