import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      if (error != null && error is FileSelectError) {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text(error.message),
                              content: const Text('Tentar Novamente!!!'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.of(ctx).pop(),
                                  child: const Text('Não'),
                                ),
                                ElevatedButton(
                                  onPressed: controller.openFile,
                                  child: const Text('Sim'),
                                ),
                              ],
                            );
                          },
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.verifyStatusApi,
        label: const FaIcon(FontAwesomeIcons.fileArrowUp),
        tooltip: 'Upload de arquivo',
      ),
    );
  }
}
