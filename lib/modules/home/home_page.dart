import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 450,
                  width: 450,
                  child: Image.asset('assets/images/logo.jpg'),
                ),
                SizedBox(
                  height: 80,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async => controller.getFile(),
                    child: const Text(
                      'Upload\n\nBase de Dados',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
