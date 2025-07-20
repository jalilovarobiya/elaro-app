import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/source/main_source.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteEmptyWidget extends StatefulWidget {
  const FavoriteEmptyWidget({super.key});

  @override
  State<FavoriteEmptyWidget> createState() => _FavoriteEmptyWidgetState();
}

class _FavoriteEmptyWidgetState extends State<FavoriteEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.favorite_rounded,
          size: 100,
          color: AppColor.lightGray600,
        ),
        const SizedBox(height: 10),
        Text(
          "empty_card".tr(),
          style: AppStyle.w500s17h20DarkBlue500.copyWith(
            color: AppColor.lightGray700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),

          child: InkWell(
            onTap: () {
              MainSources.currentPage.value = 0;
              context.pop(AppRouter.home);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: Text(
                  "Mahsulotlarni ko'rish",
                  style: AppStyle.w500s15h20DarkBlue500.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
