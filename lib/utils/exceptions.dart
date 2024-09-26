
class ServerException implements Exception {
  String message = '';
  int code;

  ServerException({required this.message, required this.code});

  ServerException.fromJson(this.code, dynamic json) {
    if (json is Map<String, dynamic>) {
      final error = json['error'];
      message =
          error is Map<String, dynamic> ? error['message'] : error.toString();
    } else if (json is String) {
      message = json;
    }
    code = code;
  }

  @override
  String toString() => message;
}
