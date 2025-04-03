import 'dart:convert';

import 'package:http/http.dart' as http;

import '../https.dart';

class NetworkHttpService implements NetworkClientService {
  final http.Client _client;
  final String _contentTypeTitle = 'Content-Type';
  final String _contentType = 'application/json';

  NetworkHttpService({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<NetworkResponse> get(String path, {JSON? queryParameters, HEADERS? headers}) async {
    // TODO: error handling
    final uri = Uri.parse(path).replace(queryParameters: queryParameters);
    final response = await _client.get(uri, headers: {...?headers});

    return NetworkResponse(
      statusCode: response.statusCode,
      data: json.decode(response.body),
      headers: response.headers,
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
    final uri = Uri.parse(path).replace(queryParameters: queryParameters);
    final response = await _client.post(
      uri,
      headers: {...?headers, _contentTypeTitle: _contentType},
      body: json.encode(data),
    );

    return NetworkResponse(
      statusCode: response.statusCode,
      data: response.body.isEmpty ? null : json.decode(response.body),
      headers: response.headers,
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
    final uri = Uri.parse(path).replace(queryParameters: queryParameters);
    final response = await _client.put(
      uri,
      headers: {...?headers, _contentTypeTitle: _contentType},
      body: json.encode(data),
    );

    return NetworkResponse(
      statusCode: response.statusCode,
      data: response.body.isEmpty ? null : json.decode(response.body),
      headers: response.headers,
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
    final uri = Uri.parse(path).replace(queryParameters: queryParameters);
    final response = await _client.patch(
      uri,
      headers: {...?headers, _contentTypeTitle: _contentType},
      body: json.encode(data),
    );

    return NetworkResponse(
      statusCode: response.statusCode,
      data: response.body.isEmpty ? null : json.decode(response.body),
      headers: response.headers,
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
    final uri = Uri.parse(path).replace(queryParameters: queryParameters);
    final response = await _client.delete(
      uri,
      headers: {...?headers, _contentTypeTitle: _contentType},
      body: json.encode(data),
    );

    return NetworkResponse(
      statusCode: response.statusCode,
      data: response.body.isEmpty ? null : json.decode(response.body),
      headers: response.headers,
    );
  }
}
