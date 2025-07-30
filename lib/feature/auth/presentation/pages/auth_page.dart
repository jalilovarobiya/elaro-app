import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/source/main_source.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => LoadingWidget(),
            register: (phone) {
              context.push(AppRouter.register, extra: phone);
            },
            goToOtp: (phone) {
              context.push(AppRouter.otp, extra: phone);
            },
            success: () {
              MainSources.currentPage.value == 0;
              context.go(AppRouter.home);
            },
            failure: (failure) {
              CustomToast.showToast(
                context,
                AppImages.error,
                failure.error,
                Colors.white,
                Colors.red,
              );
            },
            orElse: () => SizedBox(),
          );
        },
        child: const _AuthScaffold(),
      ),
    );
  }
}

class _AuthScaffold extends StatelessWidget {
  const _AuthScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome".tr()),
        centerTitle: true,
        leading:
            context.canPop()
                ? IconButton(
                  onPressed: () {
                    MainSources.currentPage.value == 0;
                    context.go(AppRouter.home);
                  },
                  icon: Icon(
                    CupertinoIcons.xmark,
                    color: AppColor.primary,
                    size: 16,
                  ),
                )
                : SizedBox(),
      ),
      body: AuthBody(),
    );
  }
}
