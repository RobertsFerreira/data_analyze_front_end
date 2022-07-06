import 'package:dio/dio.dart';

import '../../interface/http_client_interface.dart';

class DioClientHttp implements HttpClientInterface {
  //TODO: Tratar erros do Dio

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
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    dynamic data,
  }) async {
    try {
      final result = await _dio.post(url, data: data);
      return result.data;
    } catch (e) {
      rethrow;
    }
  }
}
