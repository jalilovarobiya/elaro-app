import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/core/interceptor/interceptor.dart';
import 'package:elaro_app/core/secure_storage.dart/secure_storage.dart';
import 'package:elaro_app/feature/profile/data/model/profile_model.dart';
import 'package:elaro_app/feature/profile/domain/repo/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final DioClient client;

  ProfileRepositoryImpl(this.client);

  @override
  Future<Either<FailureModel, ProfileModel>> getProfile() async {
    final request = await client.get(url: "/profile");
    if (request.isSuccess) {
      await SecureStorage().write(
        key: "user",
        value: json.encode(request.response),
      );
      return Right(ProfileModel.fromJson(request.response));
    }
    return Left(FailureModel(request.response["message"]));
  }

  @override
  Future<void> profileEdit({
    required String? name,
    required String? surname,
    required String? address,
  }) async {
    final request = await client.put(
      url: "/edit-profile",
      body: {
        if (name != null) "name": name,
        if (surname != null) "surname": surname,
        if (address != null) "address": address,
      },
    );
  }
}
