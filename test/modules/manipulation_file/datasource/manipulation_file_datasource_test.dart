import 'dart:io';

import 'package:data_analyze/models/error/exception/generic_exception.dart';
import 'package:data_analyze/modules/manipulation_file/datasource/manipulation_file_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import '../../../utils/utils.dart';

void main() {
  group('testes da função de abertura de um arquivo ', () {
    test(
      'Deve retornar um arquivo ao receber um caminho ',
      () {
        final ManipulationFileDataSource fileDataSource =
            ManipulationFileDataSource();

        final file = fileDataSource.openFile(path);

        expect(file.fold(id, id), isA<File>());
      },
    );

    test(
      'Deve retornar um erro ao receber um caminho inexistente ',
      () {
        final ManipulationFileDataSource fileDataSource =
            ManipulationFileDataSource();

        final file = fileDataSource.openFile('$path/a');

        expect(file.fold(id, id), isA<UnknownError>());
      },
    );
  });
}
