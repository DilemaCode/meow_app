import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';

enum StatusCode {
  not_found,
  bad_request,
  server_error,
  connection_error,
  created,
  success,
  unauthorized,
  forbidden,
  conflict,
  too_many_request,
  time_out
}

typedef Future<Response> _ApiUrl();
typedef T _Mapping<T>(Map<String, dynamic> data);

StatusCode getStatus(int statusCode) {
  switch (statusCode) {
    case 201:
      return StatusCode.created;
    case 200:
      return StatusCode.success;
    case 400:
      return StatusCode.bad_request;
    case 401:
      return StatusCode.unauthorized;
    case 403:
      return StatusCode.forbidden;
    case 404:
      return StatusCode.not_found;
    case 409:
      return StatusCode.conflict;
    case 429:
      return StatusCode.too_many_request;
    case 504:
      return StatusCode.time_out;
    default:
      return StatusCode.server_error;
  }
}

class ApiResponse<T> extends Equatable {
  final T? data;
  final StatusCode statusCode;
  final String? message;

  const ApiResponse({this.data, required this.statusCode, this.message});

  bool get isSuccess => statusCode == StatusCode.success;

  @override
  List<Object?> get props => [
        data,
        statusCode,
        message,
      ];
}

class RequestBase {
  final Connectivity _networkInfo;

  RequestBase(this._networkInfo);

  Future<ApiResponse<T>> call<T>({
    required _ApiUrl functionUrl,
    required _Mapping<T> mapping,
  }) async {
    final result =
        (await _networkInfo.checkConnectivity()) != ConnectivityResult.none;
    if (!result) {
      ApiResponse<T> apiResponse = ApiResponse(
        statusCode: StatusCode.connection_error,
      );
      AppController.instance.errorSnackbar(noInternet: true);
      return apiResponse;
    }
    StatusCode statusCode;

    try {
      final resp = await functionUrl();
      StatusCode status = getStatus(resp.statusCode!);

      if (status != StatusCode.success) {
        throw DioError(
          requestOptions: RequestOptions(path: ''),
          response: Response(
            statusCode: resp.statusCode,
            data: resp.data != null ? jsonDecode(resp.data) : null,
            headers: resp.headers,
            extra: resp.extra,
            requestOptions: RequestOptions(path: ''),
          ),
        );
      }

      statusCode = getStatus(resp.statusCode ?? 500);

      if (resp.data is String) {
        resp.data = {'data': resp.data ?? ''};
      }
      if (resp.data is! Map || !((resp.data as Map).containsKey('data'))) {
        resp.data = {'data': resp.data ?? ''};
      }

      final data = mapping(resp.data);
      if (statusCode == StatusCode.success) {
        return ApiResponse(
          data: data,
          statusCode: statusCode,
        );
      }

      return ApiResponse(
        statusCode: statusCode,
      );
    } on DioError catch (e) {
      statusCode = getStatus(e.response?.statusCode ?? 500);
      if (statusCode != StatusCode.server_error) {
        return ApiResponse(
          statusCode: statusCode,
        );
      }
      throw Exception();
    } catch (e) {
      if (kDebugMode) {
        print('------------- EL MAPEO EXPLOTO --------------');
        print('$e');
        print('---------------------------------------------');
      }
      throw Exception();
    }
  }
}
