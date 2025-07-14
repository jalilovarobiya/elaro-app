import 'package:clean_arxitekture/core/constants/app_colors.dart';
import 'package:clean_arxitekture/core/constants/app_images.dart';
import 'package:clean_arxitekture/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void goToHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    if (context.mounted) {
      context.go(AppRouter.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    goToHome(context);
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: SvgPicture.asset(
          AppImages.logo,
          color: Colors.white,
          height: 50,
        ),
      ),
    );
  }
}
