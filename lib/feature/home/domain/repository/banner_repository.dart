import 'package:clean_arxitekture/core/failure/failure_model.dart';
import 'package:clean_arxitekture/feature/home/data/model/banner_model.dart';
import 'package:dartz/dartz.dart';

abstract class BannerRepository {
  Future<Either<FailureModel, BannerModel>> fetchdata();
}
