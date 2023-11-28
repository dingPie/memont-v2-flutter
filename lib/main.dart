import 'package:flutter/material.dart';
import 'package:flutter_init/config/build_context_extention.dart';
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
      providers: [
        // P_MEMO: Theme Provider
        ChangeNotifierProvider(
          create: (context) => AppTheme(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.watch<AppTheme>().themeMode,
        // debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: '테스트 앱'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void darkMode() {
    var themeMode = context.read<AppTheme>().themeMode;
    // 이게 검사가 되는게 신기하네..
    if (themeMode == ThemeMode.dark) {
      context.read<AppTheme>().themeMode = ThemeMode.light;
    } else {
      context.read<AppTheme>().themeMode = ThemeMode.dark;
    }
    print(themeMode);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.gray[500],
        title: Text(
          widget.title,
          style: TextStyle(
            color: context.colors.gray[100],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: context.textStyle.h1.copyWith(
                color: context.colors.gray[700],
              ),
            ),
            Text(
              '$_counter',
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: darkMode,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
