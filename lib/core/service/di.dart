import 'package:clean_arxitekture/core/interceptor/interceptor.dart';
import 'package:clean_arxitekture/feature/home/data/repository/products_repository_impl.dart';
import 'package:clean_arxitekture/feature/product/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:clean_arxitekture/feature/product/presentation/blocs/products/bloc/products_bloc.dart';
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
  sl.registerLazySingleton<ProductsRepositoryImpl>(
    () => ProductsRepositoryImpl(sl<DioClient>()),
  );
}

void _blocs() {
  sl.registerFactory(() => ProductsBloc(sl<ProductsRepositoryImpl>()));
}

void _dataSources() {}

void _styles() {}
