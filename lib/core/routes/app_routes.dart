import 'package:clean_arxitekture/feature/card/presentation/pages/card_creen.dart';
import 'package:clean_arxitekture/feature/category/presentation/pages/category_screen.dart';
import 'package:clean_arxitekture/feature/home/presentation/screens/home_screen.dart';
import 'package:clean_arxitekture/feature/main/screen/main_screen.dart';
import 'package:clean_arxitekture/feature/order/presentation/pages/order_screen.dart';
import 'package:clean_arxitekture/feature/profile/presentation/pages/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/home",
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationshell) =>
                MainScreen(navigationShell: navigationshell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/home",
                name: "/home",
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/category",
                name: "/category",
                builder: (context, state) => CategoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/card",
                name: "/card",
                builder: (context, state) => CardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/order",
                name: "/order",
                builder: (context, state) => OrderScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/profile",
                name: "/profile",
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
