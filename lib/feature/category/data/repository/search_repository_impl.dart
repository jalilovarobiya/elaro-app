import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/core/interceptor/interceptor.dart';
import 'package:elaro_app/feature/category/data/model/search_model.dart';
import 'package:elaro_app/feature/category/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final DioClient client;

  SearchRepositoryImpl(this.client);

  @override
  Future<Either<FailureModel, SearchModel>> search(String query) async {
    final request = await client.post(
      url: "/global-search",
      body: {"text": query},
    );
    if (request.isSuccess) {
      return Right(SearchModel.fromJson(request.response));
    }
    return Right(SearchModel(products: [], categories: [], subCategories: []));
  }
}
