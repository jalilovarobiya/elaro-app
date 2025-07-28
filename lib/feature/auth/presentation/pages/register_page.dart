import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.phone});

  final String? phone;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            goToOtp: (number) {
              context.push(AppRouter.otp, extra: number);
            },
            failure: (failure) {},
          );
        },
        child: Scaffold(
          appBar: CustomAppBar(
            titleUz: "Ro'yxatdan o'tish",
            titleRu: "Регистрация",
            titleCrl: "Рўйхатдан ўтиш",
          ),
          body: RegisterBody(phone: widget.phone),
        ),
      ),
    );
  }
}
