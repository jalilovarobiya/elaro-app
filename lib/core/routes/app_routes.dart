import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/feature/auth/presentation/pages/auth_page.dart';
import 'package:elaro_app/feature/card/presentation/pages/card_creen.dart';
import 'package:elaro_app/feature/category/data/model/category_constructr.dart';
import 'package:elaro_app/feature/category/data/model/sub_category_constructr_model.dart';
import 'package:elaro_app/feature/category/presentation/pages/category_page.dart';
import 'package:elaro_app/feature/category/presentation/pages/category_screen.dart';
import 'package:elaro_app/feature/category/presentation/pages/global_search_page.dart';
import 'package:elaro_app/feature/category/presentation/pages/sub_category_page.dart';
import 'package:elaro_app/feature/home/data/model/brand_constructr_model.dart';
import 'package:elaro_app/feature/home/presentation/screens/brand_page.dart';
import 'package:elaro_app/feature/home/presentation/screens/hit_products_page.dart';
import 'package:elaro_app/feature/home/presentation/screens/home_screen.dart';
import 'package:elaro_app/feature/home/presentation/screens/new_products_page.dart';
import 'package:elaro_app/feature/home/presentation/screens/product_page.dart';
import 'package:elaro_app/feature/home/presentation/screens/recomanded_products_page.dart';
import 'package:elaro_app/feature/auth/presentation/pages/otp_screen.dart';
import 'package:elaro_app/feature/auth/presentation/pages/register_page.dart';
import 'package:elaro_app/feature/main/screen/main_screen.dart';
import 'package:elaro_app/feature/order/presentation/pages/order_history_page.dart';
import 'package:elaro_app/feature/profile/data/model/product_constructor_model.dart';
import 'package:elaro_app/feature/profile/presentation/pages/favourite_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/language_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/location_screen.dart';
import 'package:elaro_app/feature/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/data/model/description_constructor_model.dart';
import '../../feature/home/data/model/features_constructor_model.dart';

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
  static String recomand = "/recomand";
  static String newProducts = "/newProducts";
  static String hitProduct = "/hitProduct";
  static String auth = "/auth";
  static String otp = "/otp";
  static String register = "/register";
  static String product = "/product";
  static String features = "/features";
  static String description = "/description";
  static String ourShops = "/ourShops";




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
                      child: FutureBuilder<bool>(
                        future: Utils().isLogin(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data! ? CardScreen() : AuthPage();
                          }
                          return SizedBox();
                        },
                      ),
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
                      child: FutureBuilder<bool>(
                        future: Utils().isLogin(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!
                                ? OrderHistoryPage()
                                : AuthPage();
                          }
                          return SizedBox();
                        },
                      ),
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
      GoRoute(
        path: AppRouter.recomand,
        name: AppRouter.recomand,
        builder: (context, state) {
          return RecomandedProductsPage();
        },
      ),
      GoRoute(
        path: AppRouter.hitProduct,
        name: AppRouter.hitProduct,
        builder: (context, state) {
          return HitProductsPage();
        },
      ),
      GoRoute(
        path: AppRouter.newProducts,
        name: AppRouter.newProducts,
        builder: (context, state) {
          return NewProductsPage();
        },
      ),
      GoRoute(
        path: AppRouter.auth,
        name: AppRouter.auth,
        builder: (context, state) {
          return AuthPage();
        },
      ),
      GoRoute(
        path: AppRouter.otp,
        name: AppRouter.otp,
        builder: (context, state) {
          final phone = state.extra as String?;
          return OtpScreen(phoneNumber: phone);
        },
      ),
      GoRoute(
        path: register,
        name: register,
        builder: (context, state) {
          final phone = state.extra as String;
          return RegisterPage(phone: phone);
        },
      ),
      GoRoute(
        path: product,
        name: product,
        builder: (context, state) {
          final data = state.extra as ProductConstructorModel;
          return ProductPage(
            id: data.id,
            titleUzb: data.titleUzb,
            titleRus: data.titleRus,
            titleCrl: data.titleCrl,
          );
        },
      ),
      // GoRoute(
      //   path: AppRouter.features,
      //   builder: (context, state) {
      //     final data = state.extra as FeaturesConstructorModel;
      //     return FeaturesPage(data: data);
      //   },
      // ),
      // GoRoute(
      //   path: AppRouter.description,
      //   builder: (context, state) {
      //     final data = state.extra as DescriptionConstructorModel;
      //     return DescriptionPage(data: data);
      //   },
      // ),
      // GoRoute(
      //     path: AppRouter.ourShops,
      //     builder: (context, state){
      //       return const OurShopsPage();
      //     }
      // ),
    ],
  );
}
