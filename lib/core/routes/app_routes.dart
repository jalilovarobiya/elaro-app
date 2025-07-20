import 'package:elaro_app/feature/card/presentation/pages/card_creen.dart';
import 'package:elaro_app/feature/category/data/model/category_constructr.dart';
import 'package:elaro_app/feature/category/data/model/sub_category_constructr_model.dart';
import 'package:elaro_app/feature/category/presentation/pages/category_page.dart';
import 'package:elaro_app/feature/category/presentation/pages/category_screen.dart';
import 'package:elaro_app/feature/category/presentation/pages/global_search_page.dart';
import 'package:elaro_app/feature/category/presentation/pages/sub_category_page.dart';
import 'package:elaro_app/feature/home/data/model/brand_constructr_model.dart';
import 'package:elaro_app/feature/home/presentation/screens/brand_page.dart';
import 'package:elaro_app/feature/home/presentation/screens/home_screen.dart';
import 'package:elaro_app/feature/main/screen/main_screen.dart';
import 'package:elaro_app/feature/order/presentation/pages/order_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/favourite_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/language_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/location_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
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
  static String brand = "/brand";
  static String favourite = "/favourite";
  static String location = "/location";
  static String language = "/language";

  static GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
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

      GoRoute(
        path: AppRouter.brand,
        name: AppRouter.brand,
        builder: (context, state) {
          final data = state.extra as BrandConstructorModel;
          return BrandPage(data: data);
        },
      ),

      GoRoute(
        path: AppRouter.favourite,
        name: AppRouter.favourite,
        builder: (context, state) {
          return FavouriteScreen();
        },
      ),

      GoRoute(
        path: AppRouter.location,
        name: AppRouter.location,
        builder: (context, state) {
          return LocationScreen();
        },
      ),

      GoRoute(
        path: AppRouter.search,
        name: AppRouter.search,
        builder: (context, state) {
          return GlobalSearchPage();
        },
      ),

      GoRoute(
        path: AppRouter.language,
        name: AppRouter.language,
        builder: (context, state) {
          return LanguageScreen();
        },
      ),
    ],
  );
}
