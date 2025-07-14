import 'package:clean_arxitekture/core/failure/failure_model.dart';
import 'package:clean_arxitekture/core/interceptor/interceptor.dart';
import 'package:clean_arxitekture/feature/home/data/model/brend_model.dart';
import 'package:clean_arxitekture/feature/home/data/model/brends_model.dart';
import 'package:clean_arxitekture/feature/home/domain/repository/brends_repository.dart';
import 'package:dartz/dartz.dart';

class BrendsRepositoryImpl implements BrendsRepository {
  final DioClient client;

  BrendsRepositoryImpl(this.client);

  @override
  Future<Either<FailureModel, BrandModel>> brend(int id) async {
    final response = await client.get(url: "/brands/$id");
    if (response.isSuccess) {
      final data = BrandModel.fromJson(response.response);
      return Right(data);
    } else {
      return Left(FailureModel(response.response["message"]));
    }
  }

  @override
  Future<Either<FailureModel, BrandsModel>> brends() async {
    final response = await client.get(url: "/brands");
    if (response.isSuccess) {
      final data = BrandsModel.fromJson(response.response);
      return Right(data);
    } else {
      return Left(FailureModel(response.response["message"]));
    }
  }
}
