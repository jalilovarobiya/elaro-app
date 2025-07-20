import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/category/data/model/search_model.dart';

abstract class SearchRepository {
  Future<Either<FailureModel, SearchModel>> search(String query);
}
