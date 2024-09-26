
import 'package:dio/dio.dart';

import 'decoded_response.dart';

abstract class INetworkHandler {

  Future<DecodedResponse> get(
      {required String path});

  Future<DecodedResponse> head(
      {required String path});

  Future<DecodedResponse> post(
      {required String path,
        String body = "",
        CancelToken? cancelToken,
        Map<String, dynamic>? additionHeaders});

  Future<DecodedResponse> put({
    required String path,
    String body = "",
    CancelToken? cancelToken
  });

  Future<DecodedResponse> patch({
    required String path,
    String body = ""
  });

  Future<DecodedResponse> delete(
      {required String path, String body = ""});

}
