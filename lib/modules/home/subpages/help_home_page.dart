import 'package:flutter/material.dart';

class HelpHomePage extends StatelessWidget {
  const HelpHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        steps: [
          Step(
            title: const Text('asasa'),
            content: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Navigator.of(context).pushNamed('helpHero'),
              child: Hero(
                tag: 'help',
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
