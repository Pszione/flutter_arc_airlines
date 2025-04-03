import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../https/https.dart';

GetIt get di => GetIt.instance;

abstract class DependencyInjection {
  static Future<void> init() async {
    await di.resetScope();

    await _registerServices();
  }

  ///
  static Future<void> _registerServices() async {
    /// Network clients
    di.registerSingleton<Dio>(DioFactory.instance());
    di.registerLazySingleton<NetworkClientService>(() => NetworkHttpService());
    di.registerLazySingleton<NetworkDioService>(() => NetworkDioService(client: di()));
    di.registerLazySingleton<NetworkHttpService>(() => NetworkHttpService());
  }
}
