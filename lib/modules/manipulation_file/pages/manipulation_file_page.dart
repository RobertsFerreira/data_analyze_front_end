import 'package:cool_alert/cool_alert.dart';
import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/error/exception/generic_exception.dart';
import '../controller/manipulation_file_controller.dart';
import '../models/error/file_errors.dart';

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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    readOnly: true,
                    controller: controller.textEditingController,
                    decoration: const InputDecoration(
                      label: Text('Arquivo Selecionado'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Observer(
                  builder: (_) {
                    dynamic error = controller.error;
                    return ElevatedButton(
                      onPressed: () async {
                        await controller.openFile();
                        error = controller.error;
                        if (error is FileSelectError) {
                          _openDialog(
                            message: error.message,
                            type: CoolAlertType.error,
                            functionConfirm: controller.openFile,
                            text: 'Tentar Novamente',
                            functionCancel: () => Navigator.of(context).pop(),
                            showBtnCancel: true,
                          );
                        } else if (error is FileNotFound) {
                          _openDialog(
                            message: error.message,
                            type: CoolAlertType.error,
                          );
                        } else if (error is InvalidFileError) {
                          _openDialog(
                            message: error.message,
                            type: CoolAlertType.error,
                          );
                        } else if (error is InvalidFileError) {
                          _openDialog(
                            message: error.message,
                            type: CoolAlertType.error,
                          );
                        } else if (error is UnknownError) {
                          _openDialog(
                            message: error.message,
                            type: CoolAlertType.error,
                          );
                        }
                      },
                      child: const Text('Selecionar arquivo'),
                    );
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
            const Divider()
          ],
        ),
        floatingActionButton: Observer(
          builder: (_) {
            bool success = controller.success;
            dynamic error = controller.error;
            return FloatingActionButton.extended(
              onPressed: () async {
                await controller.uploadFile();
                success = controller.success;
                error = controller.error;
                if (success) {
                  _openDialog(
                    message: 'Deu certo!!!',
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
