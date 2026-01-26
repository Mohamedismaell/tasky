import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/injection/di/common_di.dart';
import 'package:to_do_app/features/home/di/home_injection.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  CommonDi.init();
  HomeDi.init();
}
