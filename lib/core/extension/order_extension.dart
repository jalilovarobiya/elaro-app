import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:flutter/material.dart';

extension IntExtensions on int {
  Translator get getOrderHistoryStatus {
    switch (this) {
      case 1:
        return Translator(
          uz: "Buyurtma tasdiqlash jarayonida",
          ru: "Заказ в процессе подтверждения",
          crl: "Буюртма тасдиқлаш жараёнида",
          style: AppStyle.w600s15h20DarkBluePrimary,
        );
      case 2:
        return Translator(
          uz: "Buyurtma yetkazilish jarayonida",
          ru: "Заказ в процессе доставки",
          crl: "Буюртма етказилиш жараёнида",
          style: AppStyle.w600s15h20DarkBluePrimary,
        );
      case 3:
        return Translator(
          uz: "Buyurtma yetkazib berildi",
          ru: "Заказ доставлен",
          crl: "Буюртма етказиб берилди",
          style: AppStyle.w600s15h20DarkBluePrimary,
        );
      default:
        return Translator(
          uz: "Buyurtma bekor qilindi",
          ru: "Заказ отменён",
          crl: "Буюртма бекор қилинди",
          style: AppStyle.w600s15h20DarkBluePrimary,
        );
    }
  }

  Translator get getOrderHistoryStatusWhite {
    switch (this) {
      case 1:
        return Translator(
          uz: "Buyurtma tasdiqlash jarayonida",
          ru: "Заказ в процессе подтверждения",
          crl: "Буюртма тасдиқлаш жараёнида",
          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
            color: Colors.white,
          ),
        );
      case 2:
        return Translator(
          uz: "Buyurtma yetkazilish jarayonida",
          ru: "Заказ в процессе доставки",
          crl: "Буюртма етказилиш жараёнида",
          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
            color: Colors.white,
          ),
        );
      case 3:
        return Translator(
          uz: "Buyurtma yetkazib berildi",
          ru: "Заказ доставлен",
          crl: "Буюртма етказиб берилди",
          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
            color: Colors.white,
          ),
        );
      default:
        return Translator(
          uz: "Buyurtma bekor qilindi",
          ru: "Заказ отменён",
          crl: "Буюртма бекор қилинди",
          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
            color: Colors.white,
          ),
        );
    }
  }

  Color get getOrderHistoryStatusColor {
    switch (this) {
      case 1:
        return AppColor.primary;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}
