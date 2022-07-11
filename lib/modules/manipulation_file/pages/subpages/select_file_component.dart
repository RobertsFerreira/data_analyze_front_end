import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../models/error/exception/generic_exception.dart';
import '../../components/textfield/custom_textformfield.dart';
import '../../controller/manipulation_file_controller.dart';
import '../../models/error/file_errors.dart';

class SelectFileComponent extends StatelessWidget {
  final ManipulationFileController controller;
  final Function openDialog;
  const SelectFileComponent({
    Key? key,
    required this.controller,
    required this.openDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: CustomTextFormField(
            text: 'Arquivo Selecionado',
            textEditingController: controller.textEditingController,
            readOnly: true,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextFormField(
            text: 'Valor do Support Min',
            onChanged: controller.setMinSupport,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextFormField(
            text: 'Valor do Threshold Min',
            onChanged: controller.setMinThreshold,
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
                  openDialog(
                    message: error.message,
                    type: CoolAlertType.error,
                    functionConfirm: controller.openFile,
                    text: 'Tentar Novamente',
                    functionCancel: () => Navigator.of(context).pop(),
                    showBtnCancel: true,
                  );
                } else if (error is FileNotFound) {
                  openDialog(
                    message: error.message,
                    type: CoolAlertType.error,
                  );
                } else if (error is InvalidFileError) {
                  openDialog(
                    message: error.message,
                    type: CoolAlertType.error,
                  );
                } else if (error is InvalidFileError) {
                  openDialog(
                    message: error.message,
                    type: CoolAlertType.error,
                  );
                } else if (error is UnknownError) {
                  openDialog(
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
    );
  }
}
