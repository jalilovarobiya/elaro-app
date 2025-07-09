import 'package:clean_arxitekture/core/interceptor/interceptor.dart';
import 'package:clean_arxitekture/core/utils/utils.dart';
import 'package:clean_arxitekture/feature/home/data/model/product_model.dart';
import 'package:clean_arxitekture/feature/home/data/model/products_model.dart';
import 'package:clean_arxitekture/feature/home/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final DioClient dio;

  ProductsRepositoryImpl(this.dio);

  @override
  Future<ProductsModel> fetchDiscountProducts() async {
    final response = await dio.dioClient.get("/products-discount");
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductsModel> fetchHitProducts() async {
    final response = await dio.dioClient.get("/products-hit");
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductsModel> fetchNewProducts() async {
    final response = await dio.dioClient.get("/products-new");
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductsModel> fetchProducts() async {
    final response = await dio.dioClient.get("/products");
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductsModel.fromMap(response.data);
    }
    throw response.data;
  }

  @override
  Future<ProductModel> fetchProductsById(int id) async {
    final response = await dio.dioClient.get("/products/$id");
    if (Utils.isDioSuccess(response.statusCode)) {
      return ProductModel.fromMap(response.data);
    }
    throw response.data;
  }
}
