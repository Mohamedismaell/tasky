import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/navigaiton/tabs_shell.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/features/home/presentation/manager/cubit/task_validation_cubit.dart';
import 'package:to_do_app/features/home/presentation/screens/add_task_screen.dart';
import 'package:to_do_app/features/home/presentation/screens/welcome_screen.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        // context.read<TaskValidationCubit>().reset();
        return const TabsShell();
      },
    ),
    GoRoute(
      path: AppRoutes.addtask,
      builder: (context, state) => const AddTaskScreen(),
    ),
  ];
}
