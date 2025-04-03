import 'package:get_it/get_it.dart';

GetIt get di => GetIt.instance;

abstract class DependencyInjection {
  static Future<void> init() async {
    await di.resetScope();

    await _registerServices();
  }

  ///
  static Future<void> _registerServices() async {}
}
