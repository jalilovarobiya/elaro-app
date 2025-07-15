import 'dart:developer';
import 'package:elaro_app/core/status_model/status_model.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:dio/dio.dart';

class DioClient {
  final String baseUrl = "http://api.elaro.uz/api";

  late final Dio dioClient;

  DioClient() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dioClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) {
          log("Method type: ${option.method}");
          log("Method path: ${option.path}");
          log("FULL URL: ${option.uri}");
          return handler.next(option);
        },
        onResponse: (response, handler) {
          log("Response status code: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (error, handler) {
          log("Error: $error");
          return handler.next(error);
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
}
