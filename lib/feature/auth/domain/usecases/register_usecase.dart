import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import '../../useacase/usecase_factory.dart';
import '../../data/models/login_model/send_otp_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase
    implements
        UseCaseFactory<
          Future<Either<FailureModel, SendOtpModel>>,
          RegisterParams
        > {
  final AuthRepository impl;
  RegisterUseCase(this.impl);
  @override
  Future<Either<FailureModel, SendOtpModel>> call(RegisterParams params) async {
    return impl.register(
      params.phone,
      params.name,
      params.password,
      params.surname,
    );
  }
}

class RegisterParams {
  final String phone;
  final String name;
  final String password;
  final String surname;
  RegisterParams(this.phone, this.name, this.password, this.surname);
}
