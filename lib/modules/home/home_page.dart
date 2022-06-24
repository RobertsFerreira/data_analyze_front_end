import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              width: 450,
              child: Image.asset('assets/images/logo.jpg'),
            ),
            Observer(
              builder: (_) {
                final isLoading = controller.isLoading;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () async => controller.getFile(),
                      label: isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Selecionar Base de Dados',
                              textAlign: TextAlign.center,
                            ),
                    ),
                    const SizedBox(width: 10),
                    FloatingActionButton.extended(
                      onPressed: () => Navigator.of(context).pushNamed('help'),
                      label: const Text('Ajuda'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
