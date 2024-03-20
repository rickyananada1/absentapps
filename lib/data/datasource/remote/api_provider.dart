import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/error_handler.dart';
import '../../../core/failure.dart';
import '../../../core/network_info.dart';
import '../../../core/request.dart';
import '../../../domain/entities/activity_model.dart';
import '../../../domain/entities/ad_clientinfo.dart';
import '../../../domain/entities/user_model.dart';
import '../../../domain/entities/working_location_model.dart';
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
      if (response.statusCode == 403) {
        return Left(Failure(response.statusCode!, 'Forbidden'));
      }
      if (response.statusCode == 404) {
        return Left(Failure(response.statusCode!, 'Not found'));
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

  Future<Either<Failure, UserModel>> getProfile(String userId) async {
    var path = '${Strings.profileEndpoint}$userId';
    Map<String, dynamic> query = {
      'select':
          'NIP,EmployeeName,DoH,Office,Department,Position,C_BPartner_ID,IsAllowFingerfromAnywhere,Biometric',
    };
    return await handleApiResponse(
      () => request.get(path, queryParameters: query),
      (data) {
        // check if data contains biometric
        if (data.containsKey('Biometric')) {
          if (data['Biometric'] != null) {
            data['Biometric'] = jsonDecode(data['Biometric']);
          } else {
            data['Biometric'] = [];
          }
        }
        return UserModel.fromJson(data);
      },
    );
  }

  Future<Either<Failure, Response>> getCompanyProfile() async {
    const path = Strings.companyProfileEndpoint;
    Map<String, dynamic> query = {
      '\$select': 'LogoReport_ID',
      '\$expand': 'AD_Client(\$select=Name)',
      '\$filter': 'AD_Client_ID eq 1000003',
    };
    return await handleApiResponse(
        () => request.get(path, queryParameters: query), (data) {
      return Response(
        requestOptions: RequestOptions(
          path: path,
          method: 'GET',
        ),
        statusCode: 200,
        statusMessage: 'OK',
        data: {
          'status': 'success',
          'message': 'Data found',
          'ad_client': AdClientinfo(
              id: data['records'][0]['id'],
              name: data['records'][0]['AD_Client'][0]['Name'],
              uid: data['records'][0]['AD_Client'][0]['uid'],
              image: data['records'][0]['LogoReport_ID']['data']),
        },
      );
    });
  }

  Future<Either<Failure, Response>> putBiometric(List<double> biometric,
      String name, String image, String C_BPartner_ID) async {
    var path = Strings.putBiometricEndpoint + C_BPartner_ID;
    Map<String, dynamic> data = {
      'Biometric': jsonEncode(biometric),
      'AD_Image_ID': {
        'filename': name,
        'data': image,
      }
    };
    return await handleApiResponse(
      () => request.put(path, data: data),
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

  Future<Either<Failure, Response>> getActivities(
      String? query, String cBpartnerId,
      {String? orderBy, int? top, int? skip, int? page}) async {
    const path = Strings.activitiesEndpoint;

    Map<String, dynamic> buildQuery = {
      '\$select':
          'DateFinger,HR_Location_ID,Latitude,Longitude,Distance,FingerType,Description',
      '\$filter': query != null
          ? 'C_BPartner_ID eq $cBpartnerId and $query'
          : 'C_BPartner_ID eq $cBpartnerId',
      '\$orderby': orderBy ?? 'DateFinger asc',
      '\$top': top,
      '\$skip': skip,
      '\$page': page
    };
    return await handleApiResponse(
      () => request.get(path, queryParameters: buildQuery),
      (data) {
        List<Activity> activities = [];
        for (var item in data['records']) {
          activities.add(Activity.fromJson(item));
        }
        return Response(
          requestOptions: RequestOptions(
            path: path,
            method: 'GET',
          ),
          statusCode: 200,
          statusMessage: 'OK',
          data: {
            'status': 'success',
            'message': 'Data found',
            'activities': activities,
            'page-count': data['page-count'],
          },
        );
      },
    );
  }

  Future<Either<Failure, List<WorkingLocation>>> getWorkingLocations() async {
    const path = Strings.workingLocationsEndpoint;
    Map<String, dynamic> query = {
      'select': 'Name,Latitude,Longitude,Radius',
    };
    return await handleApiResponse(
      () => request.get(path, queryParameters: query),
      (data) {
        List<WorkingLocation> workingLocations = [];
        for (var item in data['records']) {
          workingLocations.add(WorkingLocation.fromJson(item));
        }
        return workingLocations;
      },
    );
  }

  Future<Either<Failure, Activity>> postAttendance(
    String partnerId,
    DateTime date,
    double latitude,
    double longitude,
    int distance,
    String fingerType,
    String locationName,
  ) async {
    const path = Strings.postAttendanceEndpoint;
    Map<String, dynamic> data = {
      'C_BPartner_ID': partnerId,
      //2024-02-15T08:10:10Z
      'DateFinger': '${DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(date)}Z',
      'HR_Location_ID':
          '1000000', // '1000000' is the default value for 'HR_Location_ID
      'Latitude': latitude,
      'Longitude': longitude,
      'Distance': distance,
      'FingerType': fingerType,
      'Description': locationName,
    };
    return await handleApiResponse(
      () => request.post(path, data: data),
      (data) => Activity.fromJson(data),
    );
  }

  Future<Either<Failure, String>> getAddress(double lat, double long) async {
    const path = Strings.getAddressEndpoint;
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': long,
    };
    return await handleApiResponse(
      () => request.get(path, queryParameters: query),
      (data) => data['display_name'],
    );
  }
}
