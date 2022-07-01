import 'package:flutter/material.dart';

import 'home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(elevation: 20),
      ),
      home: HomePage(),
      // routes: {
      //   'help': (ctx) => const HelpHomePage(),
      //   'helpHero': (ctx) => const HeroImageHome(),
      // },
    );
  }
}
