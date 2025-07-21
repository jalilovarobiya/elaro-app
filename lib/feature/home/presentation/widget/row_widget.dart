import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RowWidget extends StatelessWidget {
  final String category;
  final Function() ontap;
  const RowWidget({super.key, required this.ontap, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(category.tr(), style: AppStyle.w600s17h22DarkBluePrimary),
        ZoomTapAnimation(
          onTap: ontap,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "all".tr(),
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
                WidgetSpan(
                  child: Icon(Icons.arrow_forward_ios_sharp, size: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
