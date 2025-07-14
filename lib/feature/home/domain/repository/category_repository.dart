import 'package:clean_arxitekture/core/failure/failure_model.dart';
import 'package:clean_arxitekture/feature/home/data/model/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<FailureModel, CategoryModel>> categories();
  Future<Either<FailureModel, CategoryModel>> category(int id);
  // Future<List<String>> getColors(int id);
}
