import 'package:elaro_app/core/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:elaro_app/core/interceptor/interceptor.dart';
import 'package:elaro_app/core/repository/favourite_repository.dart';
import 'package:elaro_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:elaro_app/feature/card/data/repository/card_repository_impl.dart';
import 'package:elaro_app/feature/card/presentation/blocs/card/bloc/card_bloc.dart';
import 'package:elaro_app/feature/category/data/repository/search_repository_impl.dart';
import 'package:elaro_app/feature/category/data/repository/sub_category_repository_impl.dart';
import 'package:elaro_app/feature/category/presentation/blocs/search/bloc/search_bloc.dart';
import 'package:elaro_app/feature/category/presentation/blocs/sub_category/bloc/sub_category_bloc.dart';
import 'package:elaro_app/feature/home/data/repository/banner_repository_impl.dart';
import 'package:elaro_app/feature/home/data/repository/brendS_repository_impl.dart';
import 'package:elaro_app/feature/home/data/repository/categories_repository_impl.dart';
import 'package:elaro_app/feature/home/data/repository/category_repository.dart';
import 'package:elaro_app/feature/home/data/repository/products_repository_impl.dart';
import 'package:elaro_app/feature/home/presentation/blocs/banner/bloc/banner_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/brand/bloc/brand_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/brends/bloc/brends_bloc.dart';
import 'package:elaro_app/feature/category/presentation/blocs/categories/bloc/categories_bloc.dart';
import 'package:elaro_app/feature/category/presentation/blocs/category/bloc/category_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/hit_products/bloc/hit_products_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/new_products/bloc/new_products_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:elaro_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:elaro_app/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  _client();
  _styles();
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

void _client() {
  sl.registerFactory(() => DioClient());
}

void _useCase() {}

void _repositories() {
  sl.registerLazySingleton<BannerRepositoryImpl>(
    () => BannerRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<BrendsRepositoryImpl>(
    () => BrendsRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<CategoriesRepositoryImpl>(
    () => CategoriesRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<CategoryRepositoryImpl>(
    () => CategoryRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<ProductsRepositoryImpl>(
    () => ProductsRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<SubCategoryRepositoryImpl>(
    () => SubCategoryRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<FavouriteRepositoryImpl>(
    () => FavouriteRepositoryImpl(),
  );
  sl.registerLazySingleton<SearchRepositoryImpl>(
    () => SearchRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<CardRepositoryImpl>(
    () => CardRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<ProfileRepositoryImpl>(
    () => ProfileRepositoryImpl(sl<DioClient>()),
  );
  sl.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(sl<DioClient>()),
  );
}

void _blocs() {
  sl.registerFactory(() => BannerBloc(sl<BannerRepositoryImpl>()));
  sl.registerFactory(() => BrendsBloc(sl<BrendsRepositoryImpl>()));
  sl.registerFactory(() => CategoriesBloc(sl<CategoriesRepositoryImpl>()));
  sl.registerFactory(() => CategoryBloc(sl<CategoryRepositoryImpl>()));
  sl.registerFactory(() => HitProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => NewProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => SubCategoryBloc(sl<SubCategoryRepositoryImpl>()));
  sl.registerFactory(() => FavouriteBloc(sl<FavouriteRepositoryImpl>()));
  sl.registerFactory(() => BrandBloc(sl<BrendsRepositoryImpl>()));
  sl.registerFactory(() => SearchBloc(sl<SearchRepositoryImpl>()));
  sl.registerFactory(() => CardBloc(sl<CardRepositoryImpl>()));
  sl.registerFactory(() => ProfileBloc(sl<ProfileRepositoryImpl>()));
  sl.registerFactory(() => AuthBloc(sl<AuthRepositoryImpl>()));
}

void _dataSources() {}

void _styles() {}
