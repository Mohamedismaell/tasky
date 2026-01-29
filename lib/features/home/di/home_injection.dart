import 'package:to_do_app/core/injection/service_locator.dart';
import 'package:to_do_app/core/utils/validators/form_validators.dart';
import 'package:to_do_app/core/utils/validators/user_validation.dart';
import 'package:to_do_app/features/home/data/repositories/auth_repository_impl.dart';
import 'package:to_do_app/features/home/data/sources/auth_remote_data_source.dart';
import 'package:to_do_app/features/home/domain/repositories/auth_repository.dart';
import 'package:to_do_app/features/home/presentation/manager/task_validation/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/manager/user_validation/user_validation_cubit.dart';

class HomeDi {
  HomeDi._();

  static void init() {
    //! Data Sources
    //* Auth
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );

    //! Repositories
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(),
        // networkInfo: sl<NetworkInfo>(),
      ),
    );

    //! Use Cases
    // sl.registerLazySingleton(
    //   () => LoginWithGoogle(repository: sl<AuthRepository>()),
    // );

    //! Cubits
    sl.registerLazySingleton(() => TaskValidationCubit(sl<FormValidators>()));
    sl.registerLazySingleton(() => UserValidationCubit(sl<UserValidation>()));
  }
}
