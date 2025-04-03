import 'package:equatable/equatable.dart';

import 'https.dart';

class NetworkResponse with EquatableMixin {
  final int statusCode;
  final dynamic data;
  final HEADERS headers;

  const NetworkResponse({required this.statusCode, required this.data, required this.headers});

  @override
  List<Object?> get props => [statusCode, data, headers];
}

abstract class NetworkClientService {
  Future<NetworkResponse> get(String path, {JSON? queryParameters, HEADERS? headers});

  Future<NetworkResponse> post(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  });

  Future<NetworkResponse> put(String path, {dynamic data, JSON? queryParameters, HEADERS? headers});

  Future<NetworkResponse> patch(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  });

  Future<NetworkResponse> delete(
    String path, {
    dynamic data,
    JSON? queryParameters,
    HEADERS? headers,
  });
}
