class ResponseReturn {
  final String message;
  final int statusCode;
  final dynamic body;

  ResponseReturn({
    required this.message,
    required this.statusCode,
    required this.body,
  });

  factory ResponseReturn.empty() {
    return ResponseReturn(
      body: null,
      statusCode: 0,
      message: "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'statusCode': statusCode,
      'body': body,
    };
  }

  factory ResponseReturn.fromMap(Map<String, dynamic> map) {
    return ResponseReturn(
      message: (map['message'] ?? '').toString(),
      statusCode: int.tryParse(map['statusCode'].toString()) ?? 0,
      body: map['body'],
    );
  }
}
