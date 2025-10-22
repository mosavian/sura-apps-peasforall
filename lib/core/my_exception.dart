import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sqflite/sqlite_api.dart';

import 'result.dart';

class MyException {
  static Future<Result<T>> handleError<T>(dynamic err) async {
    log("$err");
    if (err is DioException) {
      final statusCode = err.response?.statusCode;
      try {
        // if (err.response?.data["message"] != null) {
        //   return Result.error(err.response!.data["message"].toString());
        // }

        String myError = "";

        if (err.response?.data != null) {
          myError = '${err.response?.data}';
        } else {
          myError = err.message ?? 'request error';
          // myError =
          //     "${err.response?.data?["message"] ?? "request error"}${err.response?.data?["data"] != null ? "\n" : ""}${err.response?.data?["data"] ?? ""}";
        }

        return Error(myError, statusCode: statusCode ?? 400);
      } catch (err) {
        return Error("request error");
      }
    }

    if (err is WebSocketException) {
      return Error(err.message);
    }

    if (err is DatabaseException) {
      return Error(err.result?.toString() ?? 'db error');
    }

    return Error("client error: ${err.toString()}");
  }
}
