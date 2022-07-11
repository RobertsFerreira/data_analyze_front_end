import 'dart:convert';
import 'dart:typed_data';

import 'package:data_analyze/models/response_return/response_return.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../interface/http_client_interface.dart';
import '../../../models/error/exception/generic_exception.dart';

class ManipulationFileRepository {
  //TODO: Tratar errors do Dio aqui

  final HttpClientInterface client;

  ManipulationFileRepository(this.client);

  Future<Either<GenericException, ResponseReturn>> uploadFile(
    Uint8List fileB64,
    String? fileName,
    double minSupport,
    double minThreshold,
  ) async {
    try {
      FormData formData = client.toFormData(
        fileB64,
        fileName,
        minSupport,
        minThreshold,
      );
      final response = await client.post(
        '/upload',
        data: formData,
      );
      final responseResult = ResponseReturn.fromMap(
        jsonDecode(response),
      );
      return Right(responseResult);
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
