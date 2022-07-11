import 'dart:developer';
import 'dart:io';

import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:data_analyze/modules/manipulation_file/models/error/file_errors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../models/error/exception/generic_exception.dart';
import '../../../utils/async_function.dart';
import '../models/result_apriori/result_apriori.dart';

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
  double minSupport = 0.0;

  @action
  void setMinSupport(String value) => minSupport = double.tryParse(value) ?? 0;

  @observable
  double minThreshold = 0.0;

  @action
  void setMinThreshold(String value) =>
      minThreshold = double.tryParse(value) ?? 0;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  File? file;

  @observable
  dynamic error;

  @observable
  String messageSuccess = '';

  @computed
  List<String> get questions {
    if (file == null) return [];
    final lines = file!.readAsLinesSync();
    return lines[0].split(';');
  }

  @observable
  List<ResultApriori> resultApriori = <ResultApriori>[];

  @action
  Future<void> verifyStatusApi() => asyncAction(
        () async {
          await dataSource.verifyStatusApi();
        },
      );

  @action
  Future<void> uploadFile() => asyncAction(
        () async {
          setLoading(true);
          error = null;
          messageSuccess = '';

          if (file == null) throw InvalidFileError(message: 'Arquivo inválido');

          final file64 = file!.readAsBytesSync();

          final fileName = file?.path.split('\\').last;

          final result = await dataSource.uploadFile(
            file64,
            fileName: fileName,
            minSupport: minSupport,
            minThreshold: minThreshold,
          );

          result.fold(
            (l) => error = l,
            (r) {
              if (r.statusCode == 200) {
                resultApriori = (r.body as List)
                    .map(
                      (e) => ResultApriori.fromMap(e),
                    )
                    .toList();
                messageSuccess = r.message;
              }
            },
          );
          setLoading(false);
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
              final path = fileResult.files.first.path;

              if (path == null) {
                throw FileNotFound(
                  message: 'Caminho do arquivo escolhido não existe!',
                );
              }

              final result = dataSource.openFile(path);
              result.fold(
                (l) => throw (l),
                (r) {
                  textEditingController.text = r.path;

                  file = File(r.path);
                },
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
          } on FileNotFound catch (erro, stackTrace) {
            error = FileNotFound(
              message: erro.message,
              keys: ['error', 'stackTrace'],
              datas: [
                erro.toString(),
                stackTrace.toString(),
              ],
            );
            log(
              erro.message,
              error: erro,
              stackTrace: stackTrace,
            );
          } on InvalidFileError catch (erro, stackTrace) {
            error = InvalidFileError(
              message: erro.message,
              keys: ['error', 'stackTrace'],
              datas: [
                erro.toString(),
                stackTrace.toString(),
              ],
            );
            log(
              erro.message,
              error: erro,
              stackTrace: stackTrace,
            );
          } on UnknownError catch (e, s) {
            error = e;
            log(
              e.message,
              error: e,
              stackTrace: s,
            );
          }
        },
      );
}
