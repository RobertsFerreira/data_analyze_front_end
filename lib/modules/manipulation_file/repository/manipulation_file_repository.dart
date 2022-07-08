import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../interface/http_client_interface.dart';
import '../../../models/error/exception/generic_exception.dart';

class ManipulationFileRepository {
  //TODO: Tratar errors do Dio aqui

  final HttpClientInterface client;

  ManipulationFileRepository(this.client);

  Future<Either<GenericException, bool>> uploadFile(
    Uint8List fileB64,
    String? fileName,
  ) async {
    try {
      FormData formData = client.toFormData(fileB64, fileName);
      final response = await client.post(
        '/upload',
        data: formData,
      );
      log(response);
      if (response != null) {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      return Left(
        UnknownError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<Either<GenericException, bool>> verifyStatusApi() async {
    try {
      final result = await client.get('/sobre');
      if (result['version'] != '') {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      return Left(
        UnknownError(
          message: e.toString(),
        ),
      );
    }
  }
}
