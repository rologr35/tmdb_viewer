
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../res/values/constants.dart';
import '../../../utils/logger.dart';
import 'decoded_response.dart';
import 'endpoints.dart';
import 'i_network_handler.dart';

class NetworkHandler implements INetworkHandler {
  final Dio dio = Dio();


  @override
  Future<DecodedResponse> get(
      {required String path,
      ValueChanged<CancelToken>? onCancelToken}) async {
    final url =
        "${Endpoint.baseUrl}$path";
    final tokenHeader = {
      'Authorization': "Bearer ${AppConstants.authToken}",
    };
    try {
      Logger.log("-> GET: $url");
      Logger.log("-> HEADERS: $tokenHeader");

      CancelToken cancelToken = CancelToken();
      if (onCancelToken != null) onCancelToken(cancelToken);
      final res = await dio.get(url,
          cancelToken: cancelToken,
          options: Options(
            responseType: ResponseType.json,
            headers: tokenHeader
          ));

      Logger.log("<- RESPONSE CODE: ${res.statusCode}");
      Logger.log("<- RESPONSE BODY: ${res.data}");
      return DecodedResponse.fromResponse(res);
    } catch (ex) {
      Logger.log("<- EXCEPTION: $ex");
      rethrow;
    }
  }

  @override
  Future<DecodedResponse> head(
      {required String path, useApiVersion = true}) async {
    final url =
        "${Endpoint.baseUrl}$path";
    try {
      Logger.log("-> HEAD: $url");
      Dio dioHead = Dio();
      final res = await dioHead.head(url,
          options: Options(
            responseType: ResponseType.json,
          ));
      Logger.log("<- RESPONSE CODE: ${res.statusCode}");
      Logger.log("<- RESPONSE BODY: ${res.data}");
      return DecodedResponse.fromResponse(res);
    } catch (ex) {
      Logger.log("<- EXCEPTION: $ex");
      rethrow;
    }
  }

  @override
  Future<DecodedResponse> post(
      {required String path,
      String body = "",
      CancelToken? cancelToken,
      Map<String, dynamic>? additionHeaders}) async {
    final url =
        "${Endpoint.baseUrl}$path";
    Map<String, dynamic> headers = {};
    headers.addAll({
      'Authorization': "Bearer ${AppConstants.authToken}",
    });
    if (additionHeaders != null) headers.addAll(additionHeaders);

    try {
      Logger.log("-> POST: $url");
      Logger.log("-> HEADERS: $headers");
      Logger.log("-> BODY: $body");

      final res = await dio.post(url,
          data: body,
          cancelToken: cancelToken,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ));
      Logger.log("<- RESPONSE CODE: ${res.statusCode}");
      Logger.log("<- RESPONSE BODY: ${res.data}");
      return DecodedResponse.fromResponse(res);
    } catch (ex) {
      Logger.log("<- EXCEPTION: $ex");
      rethrow;
    }
  }

  @override
  Future<DecodedResponse> put(
      {required String path,
      String body = "",
      CancelToken? cancelToken,
      bool useApiVersion = true}) async {
    final url =
        "${Endpoint.baseUrl}$path";
    final tokenHeader = {
      'Authorization': "Bearer ${AppConstants.authToken}",
    };
    try {
      Logger.log("-> PUT: $url");
      Logger.log("-> HEADERS: $tokenHeader");
      Logger.log("-> BODY: $body");
      final res = await dio.put(url,
          cancelToken: cancelToken,
          data: body,
          options: Options(
            responseType: ResponseType.json,
            headers: tokenHeader,
          ));
      Logger.log("<- RESPONSE CODE: ${res.statusCode}");
      Logger.log("<- RESPONSE BODY: ${res.data}");
      return DecodedResponse.fromResponse(res);
    } catch (ex) {
      Logger.log("<- EXCEPTION: $ex");
      rethrow;
    }
  }

  @override
  Future<DecodedResponse> patch(
      {required String path,
      String body = "",
      bool useApiVersion = true}) async {
    final url =
        "${Endpoint.baseUrl}$path";
    final tokenHeader = {
      'Authorization': "Bearer ${AppConstants.authToken}",
    };
    try {
      Logger.log("-> PATCH: $url");
      Logger.log("-> HEADERS: $tokenHeader");
      Logger.log("-> BODY: $body");
      final res = await dio.patch(url,
          data: body,
          options: Options(
            responseType: ResponseType.json,
            headers: tokenHeader,
          ));
      Logger.log("<- RESPONSE CODE: ${res.statusCode}");
      Logger.log("<- RESPONSE BODY: ${res.data}");
      return DecodedResponse.fromResponse(res);
    } catch (ex) {
      Logger.log("<- EXCEPTION: $ex");
      rethrow;
    }
  }

  @override
  Future<DecodedResponse> delete(
      {required String path,
      String body = "",
      bool useApiVersion = true}) async {
    final url =
        "${Endpoint.baseUrl}$path";
    final tokenHeader = {
      'Authorization': "Bearer ${AppConstants.authToken}",
    };
    try {
      Logger.log("-> DELETE: $url");
      Logger.log("-> HEADERS: $tokenHeader");
      Logger.log("-> BODY: $body");

      final res = await dio.delete(url,
          data: body,
          options: Options(
            responseType: ResponseType.json,
            headers: tokenHeader,
          ));
      Logger.log("<- RESPONSE CODE: ${res.statusCode}");
      Logger.log("<- RESPONSE BODY: ${res.data}");
      return DecodedResponse.fromResponse(res);
    } catch (ex) {
      Logger.log("<- EXCEPTION: $ex");
      rethrow;
    }
  }
}
