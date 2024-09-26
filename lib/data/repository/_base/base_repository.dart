

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/res/values/constants.dart';
import '../../../utils/exceptions.dart';

class BaseRepository {
  ResultError<T> resultError<T>(dynamic ex) {
    String message = ex.toString();
    int code = -1;
    if (ex is ServerException) {
      message = ex.message;
      code = ex.code;
    } else if (ex is SocketException) {
      message = "SocketException";
    }else if(ex is DioException && ex.message?.contains("400") == true){
      code = AppConstants.codeBadRequest;
    } else if(ex is DioException && ex.message?.contains("401") == true){
      code = AppConstants.codeUnAuthorized;
    }else if(ex is DioException && ex.message?.contains("403") == true){
      code = AppConstants.codeForbidden;
    }else if(ex is DioException && ex.message?.contains("404") == true){
      code = AppConstants.codeNotFound;
    }else if(ex is DioException && ex.message?.contains("406") == true){
      code = AppConstants.codeNotAccepted;
    }else if(ex is DioException && ex.message?.contains("409") == true){
      code = AppConstants.codeConflict;
    }else if(ex is DioException && ex.message?.contains("412") == true){
      code = AppConstants.codePreconditionsFailed;
    }else if(ex is DioException && ex.message?.contains("422") == true){
      code = AppConstants.codeUnprocessableEntity;
    }else if(ex is DioException && ex.message?.contains("451") == true){
      code = AppConstants.codeUnavailableLegalReason;
    }else if(ex is DioException && ex.message?.contains("503") == true){
      code = AppConstants.codeServiceUnavailable;
    }
    return Result.error(error: message, code: code);
  }
}
