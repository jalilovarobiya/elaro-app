import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:elaro_app/feature/profile/data/model/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl impl;

  AuthBloc(this.impl) : super(const AuthState.initial()) {
    on<_CheckRegister>(_onCheckRegister);
    on<_Register>(_onRegister);
    on<_OtpVerify>(_onOtpVerify);
  }

  Future<void> _onCheckRegister(
    _CheckRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final result = await impl.login(event.number, "");
      result.fold(
        (failure) {
          if (failure.error.contains("registed")) {
            emit(AuthState.register(phone: event.number));
          } else {
            emit(AuthState.failure(failure));
          }
        },
        (data) {
          emit(AuthState.goToOtp(phone: event.number));
        },
      );
    } on DioException catch (e) {
      emit(AuthState.failure(FailureModel(e.message ?? e.toString())));
    } on String catch (e) {
      if(e == "registed"){
        emit(AuthState.register(phone: event.number));
        return;
      }
    }  on Exception catch (e) {
      emit(AuthState.failure(FailureModel(e.toString())));
    }
  }

  Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final result = await impl.register(
        event.number,
        event.name,
        event.password,
        event.surname,
      );

      result.fold(
        (failure) => emit(AuthState.failure(failure)),
        (data) => emit(AuthState.goToOtp(phone: event.number)),
      );
    } catch (e) {
      emit(AuthState.failure(FailureModel(e.toString())));
    }
  }

  Future<void> _onOtpVerify(_OtpVerify event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final result = await impl.otpVerify(event.number, event.otpCode);

      result.fold((failure) => emit(AuthState.failure(failure)), (data) async {
        emit(const AuthState.success());
      });
    } catch (e) {
      emit(AuthState.failure(FailureModel(e.toString())));
    }
  }
}
