import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/core/interceptor/interceptor.dart';
import 'package:elaro_app/feature/profile/data/model/regions_model.dart';
import 'package:elaro_app/feature/profile/domain/repo/region_repository.dart';

class RegionRepositoryImpl implements RegionRepository {
  final DioClient client;

  RegionRepositoryImpl(this.client);

  @override
  Future<Either<FailureModel, RegionsModel>> fetchRegion() async {
    final request = await client.get(
        url: "https://www.kncoder.uz/json.json", anotherlink: true);
    if (request.isSuccess) {
      return Right(RegionsModel.fromJson(request.response));
    }
    return Left(FailureModel(request.response));
  }
}
