import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/widgets/lottei_widget.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LotteiWidget(image: AppImages.lottieErrorJson),
          Text(
            message.tr(),
            textAlign: TextAlign.center,
            style: AppStyle.w600s15h20DarkBluePrimary,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
