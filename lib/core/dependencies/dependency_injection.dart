import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/network_experiments/data/data.dart';
import '../https/https.dart';

GetIt get di => GetIt.instance;

abstract class DependencyInjection {
  static Future<void> init() async {
    await di.resetScope();

    await _registerServices();
    await _registerDatasources();
  }

  ///
  static Future<void> _registerServices() async {
    /// Network clients
    di.registerSingleton<Dio>(DioFactory.instance());
    di.registerLazySingleton<NetworkClientService>(() => NetworkDioService(client: di()));
    di.registerLazySingleton<NetworkDioService>(() => NetworkDioService(client: di()));
    di.registerLazySingleton<NetworkHttpService>(() => NetworkHttpService());
  }

  static Future<void> _registerDatasources() async {
    di.registerLazySingleton<JsonPlaceholderDatasource>(() => JsonPlaceholderDatasource(di()));
    di.registerLazySingleton<RequestResDatasource>(() => RequestResDatasource(di()));
  }
}
