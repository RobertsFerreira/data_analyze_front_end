import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    onPressed: () {},
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
