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

  bool upload(FormData formData) {
    try {
      final response = dio.post('');
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
