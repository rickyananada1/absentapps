import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/strings.dart';

class Request {
  final Dio _dio = Dio();
  Request() {
    updateDioInterceptors();
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

  void updateDioInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: Strings.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
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
}
