import 'package:dio/dio.dart';

class HomeRepository {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://robertsilva.ddns.net:5000',
    ),
  );

  Future<bool> verifyStatsApi() async {
    try {
      final result = await dio.get('/sobre');
      if (result.data['version'] != '') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> upload(FormData formData) async {
    try {
      final response = await dio.post(
        '/upload',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
