import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/error_handler.dart';
import '../../../core/failure.dart';
import '../../../core/network_info.dart';
import '../../../core/request.dart';
import '../../../domain/entities/user_model.dart';
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

  Future<Either<Failure, Response>> login(
      String username, String password) async {
    const path = Strings.loginEndpoint;
    Map<String, dynamic> data = {
      'userName': username,
      'password': password,
      'parameters': {
        'clientId': '1000003',
        'roleId': '1000027',
        'organizationId': '1000005',
        'warehouseId': '1000023',
        'language': 'en_US',
      }
    };
    return await handleApiResponse(
      () => request.post(path, data: data),
      (data) => Response(
        requestOptions: RequestOptions(
          path: path,
          method: 'POST',
        ),
        statusCode: 200,
        statusMessage: 'OK',
        data: {
          'status': 'success',
          'message': 'Login success',
          'data': {
            'userId': data['userId'],
            'language': data['language'],
            'access_token': data['token'],
            'expires_in': 108000,
            'token_type': 'bearer',
            'scope': 'trust read write',
          },
        },
      ),
    );
  }

  Future<Either<Failure, User>> getProfile(String userId) async {
    var path = '${Strings.profileEndpoint}$userId';
    // ?$select=NIP,EmployeeName,DoH,Office,Department,Position, C_BPartner_ID
    Map<String, dynamic> query = {
      'select': 'NIP,EmployeeName,DoH,Office,Department,Position,C_BPartner_ID',
    };
    return await handleApiResponse(
      () => request.get(path, queryParameters: query),
      (data) => User.fromJson(data),
    );
  }

  Future<Either<Failure, Response>> postImages(
      String name, String description, String image) async {
    const path = Strings.postImagesEndpoint;
    Map<String, dynamic> data = {
      'IsActive': true,
      'Name': name,
      'BinaryData': image,
      'ImageURL': name,
      'Description': description,
      'EntityType': 'U',
    };
    return await handleApiResponse(
      () => request.post(path, data: data),
      (data) => Response(
        requestOptions: RequestOptions(
          path: path,
          method: 'POST',
        ),
        statusCode: 200,
        statusMessage: 'OK',
        data: {
          'status': 'success',
          'message': 'Image uploaded successfully',
          'data': data,
        },
      ),
    );
  }
}
