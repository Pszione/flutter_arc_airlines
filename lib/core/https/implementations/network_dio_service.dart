import 'package:dio/dio.dart';

import '../https.dart';

const defaultHttpError = 503;

class NetworkDioService implements NetworkClientService {
  final Dio _dio;

  NetworkDioService({Dio? client}) : _dio = client ?? Dio();

  @override
  Future<NetworkResponse> get(String path, {JSON? queryParameters, HEADERS? headers}) async {
    // TODO: error handling
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return NetworkResponse(
      statusCode: response.statusCode ?? defaultHttpError,
      data: response.data,
      headers: response.headers.map,
    );
  }

  @override
  Future<NetworkResponse> post(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  }) async {
    // TODO: error handling
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return NetworkResponse(
      statusCode: response.statusCode ?? defaultHttpError,
      data: response.data,
      headers: response.headers.map,
    );
  }

  @override
  Future<NetworkResponse> put(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  }) async {
    // TODO: error handling
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return NetworkResponse(
      statusCode: response.statusCode ?? defaultHttpError,
      data: response.data,
      headers: response.headers.map,
    );
  }

  @override
  Future<NetworkResponse> patch(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  }) async {
    // TODO: error handling
    final response = await _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return NetworkResponse(
      statusCode: response.statusCode ?? defaultHttpError,
      data: response.data,
      headers: response.headers.map,
    );
  }

  @override
  Future<NetworkResponse> delete(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  }) async {
    // TODO: error handling
    final response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return NetworkResponse(
      statusCode: response.statusCode ?? defaultHttpError,
      data: response.data,
      headers: response.headers.map,
    );
  }
}
