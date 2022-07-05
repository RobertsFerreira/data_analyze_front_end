import 'dart:developer';
import 'dart:io';

import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/async_function.dart';

part 'manipulation_file_controller.g.dart';

class ManipulationFileController = _ManipulationFileControllerBase
    with _$ManipulationFileController;

abstract class _ManipulationFileControllerBase with Store {
  final ManipulationFileDataSource dataSource;
  final TextEditingController textEditingController = TextEditingController();

  _ManipulationFileControllerBase({
    required this.dataSource,
  });

  @observable
  File? path;

  @action
  void openFile() => asyncAction(
        () async {
          final fileResult = await FilePicker.platform.pickFiles(
            withData: true,
            allowedExtensions: ['csv'],
            type: FileType.custom,
          );
          if (fileResult != null) {
            final path = fileResult.files.first.path;

            final result = dataSource.openFile(path ?? '');
            result.fold(
              (l) => log(l.message),
              (r) => textEditingController.text = r.path,
            );
          }
        },
      );
}
