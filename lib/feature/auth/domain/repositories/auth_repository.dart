import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/auth/data/repositories/auth_repository_impl.dart';
import '../../../../core/interceptor/interceptor.dart';
import '../../data/models/login_model/login_model.dart';
import '../../data/models/login_model/send_otp_model.dart';

abstract class AuthRepository {
  Future<Either<FailureModel, SendOtpModel>> login(
    String phone,
    String password,
  );
  Future<Either<FailureModel, SendOtpModel>> register(
    String phone,
    String name,
    String password,
    String surname,
  );
  Future<Either<FailureModel, LoginModel>> otpVerify(String phone, String otp);
  factory AuthRepository() => AuthRepositoryImpl(DioClient());
}
