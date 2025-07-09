import 'package:clean_arxitekture/feature/home/data/model/product_model.dart';
import 'package:clean_arxitekture/feature/home/data/model/products_model.dart';

abstract class ProductsRepository {
  Future<ProductsModel> fetchProducts();
  Future<ProductsModel> fetchHitProducts();
  Future<ProductsModel> fetchDiscountProducts();
  Future<ProductsModel> fetchNewProducts();
  Future<ProductModel> fetchProductsById(int id);
}
