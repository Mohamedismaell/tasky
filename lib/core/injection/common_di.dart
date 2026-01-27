import 'package:dio/dio.dart';
import 'package:to_do_app/core/database/api/dio_consumer.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/injection/service_locator.dart';
import 'package:to_do_app/core/theme/manager/theme_cubit.dart';

CacheHelper get cacheHelper => sl<CacheHelper>();

class CommonDi {
  CommonDi._();

  static Future<void> init() async {
    sl.registerLazySingleton(() => ThemeCubit());
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioConsumer(dio: sl<Dio>()));
    final cacheHelper = CacheHelper();
    await cacheHelper.init();
    sl.registerSingleton<CacheHelper>(cacheHelper);
  }
}
