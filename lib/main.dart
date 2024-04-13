import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memont_v2/apis/common/palette_api.dart';
import 'package:memont_v2/config/firebase_options.dart';
import 'package:memont_v2/constants/key.dart';
import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';
import 'package:memont_v2/screens/router.dart';
import 'package:memont_v2/theme/app_theme.dart';
import 'package:memont_v2/utils/util_method.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var refreshToken = prefs.getString(KEY.REFRESH_TOKEN);
  String baseUrl = UtilMethod.getBaseUrl();

  try {
    var result = await Dio().post('$baseUrl/auth/refresh', data: {
      'refreshToken': refreshToken,
    });

    SingletonStorage storage = SingletonStorage();
    String accessToken = result.data['result']['data']['accessToken'];
    storage.accessToken = accessToken;

    var paletteList = await PaletteApi.getPalette();
    var filteredList = paletteList
        ?.where((ele) => ele.name != 'White' && ele.name != 'Dark Gray')
        .toList();

    storage.paletteList = filteredList;

    runApp(MyApp(
      isLogin: true,
    ));
  } on DioException catch (error) {
    print('refresh ERROR: ${error.response}');
    runApp(MyApp(
      isLogin: false,
    ));
  }
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
    var fToast = FToast();
    fToast.init(context);

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
        ChangeNotifierProvider(
          create: (context) => TagProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp.router(
        title: "MEMO'NT",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: AppRouter(context.watch<AppState>()).router,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
      ),
    );
  }
}
