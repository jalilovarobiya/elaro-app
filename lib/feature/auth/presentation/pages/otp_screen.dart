import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/di.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/otp_body.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String? phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleUz: "Tasdiqlash",
          titleRu: "Подтвердить",
          titleCrl: "Тасдиқлаш",
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () => context.go(AppRouter.home),
              failure: (f) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(f.error)));
              },
            );
          },
          child: OtpBody(phone: widget.phoneNumber),
        ),
      ),
    );
  }
}
