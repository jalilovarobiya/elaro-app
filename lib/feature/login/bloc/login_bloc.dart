// import 'package:clean_arxitekture/core/failure/failure_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'login_event.dart';
// part 'login_state.dart';
// part "login_bloc.freezed.dart";
//
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(const LoginState.initial()) {
//     on<_RegisterSubmitted>(_onRegisterSubmitted);
//   }
//
//   Future<void> _onRegisterSubmitted(
//       _RegisterSubmitted event,
//       Emitter<LoginState> emit,
//       ) async {
//     emit(const LoginState.loading());
//
//     await Future.delayed(const Duration(seconds: 2));
//
//     // if (event.phone.startsWith("9")) {
//     //   emit(LoginState.success(event.phone));
//     // } else {
//     //   emit(const LoginState.failure("Telefon raqam noto‘g‘ri"));
//     // }
//   }
// }
