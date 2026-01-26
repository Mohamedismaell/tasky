import 'package:to_do_app/features/home/data/sources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  // final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    // required this.networkInfo,
  });
}
