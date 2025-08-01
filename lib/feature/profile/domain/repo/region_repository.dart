import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/profile/data/model/regions_model.dart';

abstract class RegionRepository {
  Future<Either<FailureModel, RegionsModel>> fetchRegion();
}
