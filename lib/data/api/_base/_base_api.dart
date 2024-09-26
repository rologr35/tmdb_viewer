
import 'package:dio/dio.dart';

import '../../../utils/exceptions.dart';

class BaseApi {
  ServerException serverException(dynamic res) {
    if (res is Response) {
      return ServerException(
          message: res.data.toString(), code: res.statusCode ?? -1);
    }
    return ServerException(message: "error", code: -1);
  }
}
