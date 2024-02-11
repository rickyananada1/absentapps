import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/error_handler.dart';
import '../../../core/failure.dart';
import '../../../core/network_info.dart';
import '../../../core/request.dart';
import '../../../utils/strings.dart';

class ApiProvider {
  final Request request;
  final SharedPreferences sharedPreferences;
  final NetworkInfo networkInfo;

  ApiProvider({
    required this.request,
    required this.sharedPreferences,
    required this.networkInfo,
  });

  Future<Either<Failure, T>> handleApiResponse<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic) fromJson,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
    try {
      final response = await apiCall();
      if (response.statusCode == 401) {
        return Left(Failure(response.statusCode!, 'Unauthorized'));
      }
      // handle if response is not json
      if (response.data is String) {
        return Left(Failure(response.statusCode!, 'Response is not JSON'));
      }
      if (response.data.containsKey('status') &&
          response.data['status'] == 'error') {
        return left(Failure(response.statusCode!, response.data['message']));
      }
      return right(fromJson(response.data));
    } on SocketException catch (e) {
      if (e.osError?.errorCode == 111) {
        return left(Failure(500, 'Network is unreachable'));
      } else {
        return left(Failure(500, 'Socket exception: $e'));
      }
    } on FormatException catch (e) {
      return left(Failure(500, 'Format exception: $e'));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return left(DataSource.RECIEVE_TIMEOUT.getFailure());
      } else if (e.type == DioExceptionType.badResponse) {
        return left(DataSource.BAD_REQUEST.getFailure());
      } else if (e.type == DioExceptionType.cancel) {
        return left(DataSource.CANCEL.getFailure());
      } else if (e.type == DioExceptionType.sendTimeout) {
        return left(DataSource.SEND_TIMEOUT.getFailure());
      } else {
        return left(
          Failure(e.response!.statusCode!, e.response!.data['message']),
        );
      }
    }
  }
}
