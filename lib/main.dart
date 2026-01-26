import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:to_do_app/core/helper/hydrated_storage.dart';
import 'package:to_do_app/core/helper/size_provider/size_provider.dart';
import 'package:to_do_app/core/helper/size_provider/sized_helper_extension.dart';
import 'package:to_do_app/core/routes/app_router.dart';
import 'core/observers/app_bloc_observer.dart';
import 'core/injection/service_locator.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Step 1: ensureInitialized done');
  Bloc.observer = AppBlocObserver();
  print('Step 2: Bloc observer set');
  HydratedBloc.storage = await buildHydratedStorage();
  print('Step 3: HydratedStorage built');
  await initializeDependencies();
  print('Step 4: Service Locator initialized');
  print('Step 5: Supabase initialized');

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => AppBootstrap()),
    // AppBootstrap(),
  );
}

//!providers
class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, mode) {
        return SizeProvider(
          baseSize: const Size(428, 926),
          height: context.screenHeight,
          width: context.screenWidth,
          child: MaterialApp.router(
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: mode.themeMode,
            routerConfig: AppRouter.router,
            builder: DevicePreview.appBuilder,
          ),
        );
      },
    );
  }
}
