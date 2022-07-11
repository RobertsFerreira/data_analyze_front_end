import 'dart:typed_data';

abstract class HttpClientInterface {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, {dynamic data, dynamic options});
  dynamic toFormData(
    Uint8List fileB64,
    String? fileName,
    double minSupport,
    double minThreshold,
  );
}
