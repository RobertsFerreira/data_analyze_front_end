import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:data_analyze/shared/clients/dio_client_http.dart';
import 'package:fpdart/fpdart.dart';

import '../../../models/error/exception/generic_exception.dart';
import '../models/error/file_errors.dart';
import '../repository/manipulation_file_repository.dart';

class ManipulationFileDataSource {
  final ManipulationFileRepository repository = ManipulationFileRepository(
    DioClientHttp(),
  );

  Future<Either<GenericException, void>> uploadFile(
    Uint8List fileB64, {
    String? filename,
  }) async {
    try {
      final result = await repository.verifyStatusApi();
      result.fold(
        (l) => throw (l),
        (r) => log(r.toString()),
      );
      return const Right(null);
    } catch (e) {
      return Left(
        UnknownError(
          message: e.toString(),
        ),
      );
    }
  }

  Either<GenericException, File> openFile(String path) {
    try {
      final file = File(path);
      if (file.existsSync()) {
        return Right(file);
      } else {
        throw FileNotFound(message: 'Caminho do arquivo escolhido não existe!');
      }
    } on FileNotFound catch (error, stackTrace) {
      return Left(
        FileNotFound(
          message: error.message,
          keys: ['path', 'error', 'stackTrace'],
          datas: [
            path,
            error.toString(),
            stackTrace.toString(),
          ],
        ),
      );
    } catch (error, stackTrace) {
      return Left(
        UnknownError(
          message: 'Erro desconhecido',
          keys: ['error', 'stackTrace'],
          datas: [
            error.toString(),
            stackTrace.toString(),
          ],
        ),
      );
    }
  }
}
