import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../interface/http_client_interface.dart';

class DioClientHttp implements HttpClientInterface {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://robertsilva.ddns.net:5000',
    ),
  );

  @override
  Future<dynamic> get(String url) async {
    try {
      final result = await _dio.get(url);
      return result.data;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    dynamic data,
    dynamic options,
  }) async {
    try {
      final result = await _dio.post(
        url,
        data: data,
        options: options,
      );
      return result.data;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  dynamic toFormData(Uint8List fileB64, String? fileName) {
    final form = FormData.fromMap({
      "file": MultipartFile.fromBytes(
        fileB64,
        filename: fileName,
      ),
    });
    return form;
  }
}
