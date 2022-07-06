import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:data_analyze/modules/manipulation_file/models/error/file_errors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../models/error/exception/generic_exception.dart';
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
  File? file;

  @observable
  dynamic error;

  @observable
  Uint8List file64 = Uint8List(1);

  @action
  void setFileB64(Uint8List bytes) => file64 = bytes;

  @action
  void verifyStatusApi() => asyncAction(
        () async {
          await dataSource.uploadFile(
            file64,
            filename: file?.path,
          );
        },
      );

  @action
  Future<void> openFile() => asyncAction(
        () async {
          error = null;
          try {
            final fileResult = await FilePicker.platform.pickFiles(
              dialogTitle: 'Selecionar Arquivo CSV',
              withData: true,
              allowedExtensions: ['csv'],
              type: FileType.custom,
              lockParentWindow: true,
            );
            if (fileResult != null) {
              final bytes = fileResult.files.first.bytes!;
              setFileB64(bytes);
              final path = fileResult.files.first.path;

              final result = dataSource.openFile(path ?? '');
              result.fold(
                (l) => throw (l),
                (r) => textEditingController.text = r.path,
              );
            } else {
              throw FileSelectError(message: "Nenhum arquivo selecionado!!!");
            }
          } on FileSelectError catch (e, s) {
            error = e;
            log(
              e.message,
              error: e,
              stackTrace: s,
            );
          } on FileNotFound catch (e, s) {
            log(
              e.message,
              error: e,
              stackTrace: s,
            );
          } on UnknownError catch (e, s) {
            log(
              e.message,
              error: e,
              stackTrace: s,
            );
          }
        },
      );
}
