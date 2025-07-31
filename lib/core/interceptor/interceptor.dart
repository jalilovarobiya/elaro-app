import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/secure_storage.dart/secure_storage.dart';
import 'package:elaro_app/core/status_model/status_model.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:dio/dio.dart';

class DioClient {
  final String baseUrl = "https://api.elaro.uz/api";

  late final Dio dioClient;
  static Future<Map<String, dynamic>> defaultHeader() async {
    String token = await SecureStorage().read(key: 'token') ?? "";
    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json, text/plain',
    };
  }

  DioClient() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    dioClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          String token = await SecureStorage().read(key: 'token') ?? "";
          if (token.isNotEmpty) {
            option.headers['Authorization'] = 'Bearer $token';
          }
          log("Method type: ${option.method}");
          log("Method path: ${option.path}");
          log("FULL URL: ${option.uri}");
          log("Token: ${token.isNotEmpty ? 'Present' : 'Not found'}");
          return handler.next(option);
        },
        onResponse: (response, handler) {
          log("Resposne body ${response.data}");
          log("Response status code: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (error, handler) {
          log("Error 1: $error");
          log("Resposne body ${error.response?.data}");
          try {
            return handler.resolve(error.response!);
          } catch (e) {
            return handler.next(error);
          }
       },
      ),
    );
  }

  Future<StatusModel> get({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? params,
    bool anotherlink = false,
  }) async {
    try {
      final requestUrl = anotherlink ? url : url;

      final response = await dioClient.get(
        requestUrl,
        options: Options(headers: {if (header != null) ...header}),
        queryParameters: params,
      );

      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }

      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      log("Unknown error: $e");
      throw Exception("Unexpected error: $e");
    }
  }

  Future<StatusModel> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dioClient.post(
        "$baseUrl$url",
        // options: Options(),
        data: jsonEncode(body),
      );
      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }
      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log(e.message.toString());
      throw Exception("Dio error: ${e.message}");
    }
  }

  Future<StatusModel> put({required String url, required dynamic body}) async {
    try {
      final response = await dioClient.put(
        "$baseUrl$url",
        // options: Options(),
        data: jsonEncode(body),
      );
      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }
      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log(e.message.toString());
      throw Exception("Dio error: ${e.message}");
    }
  }

  Future<StatusModel> delete({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dioClient.delete(
        "$baseUrl$url",
        data: jsonEncode(body ?? {}),
      );

      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }
      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      log("Unknown error: $e");
      throw Exception("Unexpected error: $e");
    }
  }


  Future<StatusModel> getMethod(
      {required pathUrl, Map<String, dynamic>? header, Map<String, dynamic>? body, required isHeader, bool anotherLink = false}) async {
    try {
      final res = await dioClient
          .get(
        "${anotherLink ? "" : baseUrl}$pathUrl",
        options: Options(headers: isHeader ? await defaultHeader() : {"Content_type": "application/json"}),
        data: jsonEncode(body ?? {}),
      )
          .timeout(const Duration(seconds: 120));
      // logger.d([
      //   'GET',
      //   "$baseUrl$pathUrl",
      //   body,
      //   header,
      //   res.statusCode,
      //   res.statusMessage,
      //   res.data,
      // ]);
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return StatusModel(response: res.data, isSuccess: true, code: res.statusCode);
      }
      return StatusModel(response: res.data, isSuccess: false, code: res.statusCode);
    } on DioException catch (e) {
      // logger.e([
      //   'GET',
      //   "$baseUrl$pathUrl",
      //   body,
      //   header,
      //   e.response?.statusCode,
      //   e.response?.statusMessage,
      //   e.response?.data,
      // ]);
      return dioError(e);
    }
  }
}
StatusModel dioError(DioException e) {
  try {
    if((e.response!.statusCode! >= 500)){
      return StatusModel(response: e.response, isSuccess: false, code: e.response?.statusCode);
    }
    if ((e.type == DioExceptionType.connectionError) || (e.type == DioExceptionType.connectionTimeout)) {
      return StatusModel(response: {"message": "connection_error".tr}, isSuccess: false, code: e.response?.statusCode);
    }
  } catch (e) {}
  return StatusModel(response: e.response, isSuccess: false, code: e.response?.statusCode);
}