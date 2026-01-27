import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/features/home/presentation/screens/add_task_screen.dart';
import 'package:to_do_app/features/home/presentation/screens/home_screen.dart';
import 'package:to_do_app/features/home/presentation/screens/welcome_screen.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.addtask,
      builder: (context, state) => const AddTaskScreen(),
    ),
  ];
}
