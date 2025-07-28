import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/profile/data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<FailureModel, ProfileModel>> getProfile();
  Future<void> profileEdit({
    required String? name,
    required String? surname,
    required String? address,
  });
}
