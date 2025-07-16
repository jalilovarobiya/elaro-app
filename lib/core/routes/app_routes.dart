import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/feature/card/presentation/pages/card_creen.dart';
import 'package:elaro_app/feature/category/data/model/category_constructr.dart';
import 'package:elaro_app/feature/category/data/model/sub_category_constructr_model.dart';
import 'package:elaro_app/feature/category/presentation/pages/category_page.dart';
import 'package:elaro_app/feature/category/presentation/pages/category_screen.dart';
import 'package:elaro_app/feature/category/presentation/pages/sub_category_page.dart';
import 'package:elaro_app/feature/home/presentation/screens/home_screen.dart';
import 'package:elaro_app/feature/main/screen/main_screen.dart';
import 'package:elaro_app/feature/main/screen/splash_screen.dart';
import 'package:elaro_app/feature/order/presentation/pages/order_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String splash = "/splash";
  static String home = "/home";
  static String category = "/category";
  static String categories = "/categories";
  static String card = "/card";
  static String order = "/order";
  static String profile = "/profile";
  static String search = "/search";
  static String globalSearch = "/globalSearch";
  static String subCategory = "/subCategory";
  static String noInternet = "/noInternet";

  static GoRouter router = GoRouter(
    initialLocation: splash,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: splash,
        name: splash,
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: SplashScreen(),
              transitionsBuilder: (context, animation, animation2, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
      ),

      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationshell) =>
                MainScreen(navigationShell: navigationshell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                name: home,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: HomeScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        animation2,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: globalSearch,
                name: globalSearch,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: CategoryScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        animation2,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: card,
                name: card,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: CardScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        animation2,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: order,
                name: order,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: OrderScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        animation2,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: profile,
                name: profile,
                pageBuilder:
                    (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: ProfileScreen(),
                      transitionsBuilder: (
                        context,
                        animation,
                        animation2,
                        child,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRouter.category,
        builder: (context, state) {
          final data = state.extra as CategoryConstructorModel;
          return CategoryPage(data: data);
        },
      ),
      GoRoute(
        path: AppRouter.subCategory,
        builder: (context, state) {
          final data = state.extra as SubCategoryConstructorModel;
          return SubCategoryPage(data: data);
        },
      ),

      // GoRoute(
      //   parentNavigatorKey: navigatorKey,
      //   path: AppRouter.noInternet,
      //   name: AppRouter.noInternet,
      //   builder: (context, state) {
      //     return NoInternetPage();
      //   },
      // ),
    ],
  );
}
