import 'package:dio/dio.dart';
import 'package:to_do_app/core/database/api/dio_consumer.dart';
import 'package:to_do_app/core/database/cache/cache_helper.dart';
import 'package:to_do_app/core/injection/service_locator.dart';
import 'package:to_do_app/core/theme/cubit/theme_cubit.dart';

class CommonDi {
  CommonDi._();

  static void init() {
    sl.registerLazySingleton(() => ThemeCubit());
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioConsumer(dio: sl<Dio>()));
    sl.registerLazySingleton(() => CacheHelper());
  }
}
