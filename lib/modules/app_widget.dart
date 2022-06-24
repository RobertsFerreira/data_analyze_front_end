import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'home/subpages/components/hero/hero_image_home.dart';
import 'home/subpages/help_home_page.dart';

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
      ),
      home: HomePage(),
      routes: {
        'help': (ctx) => const HelpHomePage(),
        'helpHero': (ctx) => const HeroImageHome(),
      },
    );
  }
}
