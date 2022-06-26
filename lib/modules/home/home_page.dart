import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/dialog/custom_dialog.dart';
import 'controller/home_controller.dart';
import 'error/home_error.dart';

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
                      onPressed: () async {
                        await controller.getFile();
                        final error = controller.error;
                        if (error is FileError) {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return CustomDialog(
                                messageTitle: 'Carregar Arquivo',
                                messageBtnNo: 'Fechar',
                                erroMessage: error.message,
                                functionBtnNo: () => Navigator.pop(ctx),
                              );
                            },
                          );
                        } else if (error is ChooseFileError) {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return CustomDialog(
                                messageTitle: 'Selecionar Arquivo',
                                messageBtnNo: 'Não',
                                messageBtnYes: 'Sim',
                                erroMessage: error.message,
                                functionBtnNo: () => Navigator.pop(ctx),
                                functionBtnYes: () async =>
                                    await controller.getFile(),
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return CustomDialog(
                                messageTitle: 'Erro Desconhecido',
                                messageBtnNo: 'Fechar',
                                erroMessage: error.message,
                                functionBtnNo: () => Navigator.pop(ctx),
                              );
                            },
                          );
                        }
                      },
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
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Ajuda'),
                          Icon(Icons.question_mark)
                        ],
                      ),
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
