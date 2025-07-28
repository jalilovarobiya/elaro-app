import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/widgets/lottei_widget.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LotteiWidget(image: AppImages.lottieLoadingJson, height: 150),
    );
  }
}
