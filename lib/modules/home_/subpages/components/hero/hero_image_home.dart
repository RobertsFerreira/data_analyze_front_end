import 'package:flutter/material.dart';

class HeroImageHome extends StatelessWidget {
  const HeroImageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'help',
          child: Image.asset('assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
