import 'package:cool_alert/cool_alert.dart';
import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controller/manipulation_file_controller.dart';
import 'subpages/select_file_component.dart';

class ManipulationFile extends StatefulWidget {
  const ManipulationFile({Key? key}) : super(key: key);

  @override
  State<ManipulationFile> createState() => _ManipulationFileState();
}

class _ManipulationFileState extends State<ManipulationFile> {
  final controller = ManipulationFileController(
    dataSource: ManipulationFileDataSource(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SelectFileComponent(
              controller: controller,
              openDialog: _openDialog,
            ),
            const Divider(),
            Expanded(
              child: Center(
                child: Observer(
                  builder: (_) {
                    final listResponseApriori = controller.resultApriori;
                    final isLoading = controller.isLoading;
                    if (isLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (listResponseApriori.isEmpty) {
                      return const Text('Não há dados');
                    }
                    return ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: listResponseApriori.length,
                      itemBuilder: (ctx, index) {
                        final resultApriori = listResponseApriori[index];
                        final questions = controller.questions;
                        return ListTile(
                          title: Text(
                              'Lift: ${resultApriori.lift.toStringAsFixed(2)}'),
                          subtitle: Text(
                            'Antecedente: ${questions[0]} -> ${resultApriori.antecedent} \nConsequente: ${questions[0]} -> ${resultApriori.consequent}',
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Observer(
          builder: (_) {
            String success = controller.messageSuccess;
            dynamic error = controller.error;
            final isLoading = controller.isLoading;
            return FloatingActionButton.extended(
              onPressed: isLoading
                  ? null
                  : () async {
                      await controller.uploadFile();
                      success = controller.messageSuccess;
                      error = controller.error;
                      if (success.isNotEmpty) {
                        _openDialog(
                          message: success,
                          type: CoolAlertType.success,
                        );
                      } else if (error != null) {
                        _openDialog(
                          message: error.message,
                          type: CoolAlertType.error,
                        );
                      }
                    },
              label: const FaIcon(FontAwesomeIcons.fileArrowUp),
              tooltip: 'Upload de arquivo',
            );
          },
        ));
  }

  void _openDialog({
    required String message,
    required CoolAlertType type,
    void Function()? functionConfirm,
    void Function()? functionCancel,
    String? text,
    bool showBtnCancel = false,
  }) {
    CoolAlert.show(
      context: context,
      type: type,
      title: message,
      onConfirmBtnTap: functionConfirm,
      onCancelBtnTap: functionCancel,
      text: text,
      width: MediaQuery.of(context).size.width * .35,
      showCancelBtn: showBtnCancel,
    );
  }
}
