import 'package:flutter/material.dart';

import 'shared/theme/app_colors.dart';
import 'modules/auth/page/auth_page.dart';
// import 'modules/home/page/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      title: 'Flutter Demo',
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
