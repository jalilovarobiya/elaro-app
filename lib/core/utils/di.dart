import 'package:clean_arxitekture/core/interceptor/interceptor.dart';
import 'package:clean_arxitekture/feature/home/data/repository/banner_repository_impl.dart';
import 'package:clean_arxitekture/feature/home/data/repository/brendS_repository_impl.dart';
import 'package:clean_arxitekture/feature/home/data/repository/categories_repository_impl.dart';
import 'package:clean_arxitekture/feature/home/data/repository/category_repository.dart';
import 'package:clean_arxitekture/feature/home/data/repository/products_repository_impl.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/banner/bloc/banner_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/brends/bloc/brends_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/categories/bloc/categories_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/category/bloc/category_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/hit_products/bloc/hit_products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/new_products/bloc/new_products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
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
}

void _blocs() {
  sl.registerFactory(() => BannerBloc(sl<BannerRepositoryImpl>()));
  sl.registerFactory(() => BrendsBloc(sl<BrendsRepositoryImpl>()));
  sl.registerFactory(() => CategoriesBloc(sl<CategoriesRepositoryImpl>()));
  sl.registerFactory(() => CategoryBloc(sl<CategoryRepositoryImpl>()));
  sl.registerFactory(() => HitProductsBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => NewProductsBloc(sl<ProductsRepositoryImpl>()));
  // sl.registerFactory(() => ProductBloc(sl<ProductsRepositoryImpl>()));
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
}

void _dataSources() {}

void _styles() {}
