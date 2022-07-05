import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../models/error/exception/generic_exception.dart';
import '../models/error/file_errors.dart';

class ManipulationFileDataSource {
  Either<GenericException, File> openFile(String path) {
    try {
      final file = File(path);
      if (file.existsSync()) {
        return Right(file);
      } else {
        throw Left(
          FileNotFound(
            message: 'Caminho do arquivo escolhido não existe!',
            keys: ['path'],
            datas: [path],
          ),
        );
      }
    } catch (e) {
      return Left(
        UnknownError(
          message: 'Erro desconhecido',
          keys: ['error'],
          datas: [e.toString()],
        ),
      );
    }
  }
}
