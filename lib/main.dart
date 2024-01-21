import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memont/providers/user.dart';
import 'package:memont/screens/router.dart';
import 'package:memont/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
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
          create: (context) => User(),
        ),
      ],
      builder: (context, _) => MaterialApp.router(
        title: "MEMO'NT",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: AppRouter(context.watch<User>()).router,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
