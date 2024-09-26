
import 'package:dio/dio.dart';

class DecodedResponse {
  int statusCode;
  dynamic body;

  DecodedResponse(
      {required this.statusCode, required this.body});

  factory DecodedResponse.fromResponse(Response res) {
    return DecodedResponse(
        statusCode: res.statusCode ?? 404,
        body: res.data);
  }
}
