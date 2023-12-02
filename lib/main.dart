import 'package:flutter/material.dart';

import 'package:flutter_init/providers/user.dart';
import 'package:flutter_init/screens/router.dart';
import 'package:flutter_init/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
        title: 'Flutter Init',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: AppRouter(context.watch<User>()).router,
        // P_FIX: theme 이 작동하지 않음. 고쳐야 함.
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
