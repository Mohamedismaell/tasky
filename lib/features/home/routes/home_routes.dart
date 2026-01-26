import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/features/home/presentation/screens/home_page.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
  ];
}
