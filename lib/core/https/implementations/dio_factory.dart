import 'dart:io';

import 'package:dio/dio.dart';

abstract class DioFactory {
  static Dio instance() {
    final dio = Dio();

    dio.options.headers = {HttpHeaders.contentTypeHeader: ContentType.json.mimeType};

    // TODO: dio.interceptors.addAll([
    //   if (kDebugMode) CurlLoggerDioInterceptor(printOnSuccess: kDebugMode),
    // ]);

    return dio;
  }
}
