import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/strings.dart';

class Request {
  final Dio _dio = Dio();
  Request() {
    getBaseUrl().then((baseUrl) {
      updateDioInterceptors(baseUrl);
    });
  }

  void updateContentType(String contentType) {
    _dio.options.headers['content-type'] = contentType;
  }

  void updateAuthorization(String token) {
    _dio.options.headers['authorization'] = 'Bearer $token';
  }

  void removeAuthorization() {
    _dio.options.headers.remove('authorization');
  }

  Future<String> getBaseUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('base_url') ?? Strings.baseUrl;
  }

  void updateBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
    saveBaseUrl(newBaseUrl);
  }

  void saveBaseUrl(String baseUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('base_url', baseUrl);
  }

  void updateDioInterceptors(String url) {
    _dio.options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
    _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioException e, handler) {
            if (e.response?.statusCode == 401) {
              return handler.reject(
                DioException(
                  requestOptions: e.requestOptions,
                  response: Response(
                    requestOptions: e.requestOptions,
                    statusCode: 401,
                    statusMessage: 'Unauthorized',
                    data: {
                      'status': 'error',
                      'message': 'Unauthorized',
                    },
                  ),
                ),
              );
            }
            return handler.next(e);
          },
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioException e, handler) {
            // if connection timeout
            if (e.type == DioExceptionType.connectionTimeout) {
              return handler.reject(
                DioException(
                  requestOptions: e.requestOptions,
                  response: Response(
                    requestOptions: e.requestOptions,
                    statusCode: 408,
                    statusMessage: 'Connection timeout',
                    data: {
                      'status': 'error',
                      'message': 'Connection timeout',
                    },
                  ),
                ),
              );
            }
            return handler.next(e);
          },
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioException e, handler) {
            // if connection timeout
            if (e.type == DioExceptionType.receiveTimeout) {
              return handler.reject(
                DioException(
                  requestOptions: e.requestOptions,
                  response: Response(
                    requestOptions: e.requestOptions,
                    statusCode: 408,
                    statusMessage: 'Receive timeout',
                    data: {
                      'status': 'error',
                      'message': 'Receive timeout',
                    },
                  ),
                ),
              );
            }
            return handler.next(e);
          },
        ),
      );
  }

  // Requests
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.post(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.put(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.delete(
      path,
      options: Options(headers: headers),
    );
  }

  // Basic Authentication
  void setBasicAuth(String username, String password) {
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    _dio.options.headers['authorization'] = basicAuth;
  }
}
