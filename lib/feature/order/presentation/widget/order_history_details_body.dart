import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/extension/order_extension.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/support_dialog.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/button_widget.dart';
import 'package:elaro_app/feature/order/data/model/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderHistoryDetailsBody extends StatefulWidget {
  final Datum data;
  const OrderHistoryDetailsBody({super.key, required this.data});

  @override
  State<OrderHistoryDetailsBody> createState() =>
      _OrderHistoryDetailsBodyState();
}

class _OrderHistoryDetailsBodyState extends State<OrderHistoryDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            (widget.data.status ?? 0).getOrderHistoryStatus,
            20.h,
            Translator(
              uz: "Buyurtma tarkibi",
              ru: "Состав заказа",
              crl: "Буюртма таркиби",
              style: AppStyle.w600s20h24DarkBluePrimary,
            ),
            12.h,
            ...List.generate(
              widget.data.products?.length ?? 0,
              (generator) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 70,
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: CachedNetworkImage(
                          imageUrl:
                              widget
                                  .data
                                  .products?[generator]
                                  .images
                                  ?.firstOrNull
                                  ?.image ??
                              "",
                        ),
                      ),
                    ),
                    12.w,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Translator(
                            uz: widget.data.products?[generator].nameUz ?? "",
                            ru: widget.data.products?[generator].nameRu ?? "",
                            crl: widget.data.products?[generator].nameCrl ?? "",
                            style: AppStyle.w500s15h20Primary,
                          ),
                          12.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${Utils.cashFormat(widget.data.products?[generator].price ?? "0")} so'm",
                              ),
                              Translator(
                                uz: "${widget.data.products?.length} dona",
                                ru: "${widget.data.products?.length} штук",
                                crl: "${widget.data.products?.length} дона",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            12.h,
            Translator(
              uz: "Sizning buyurtmangiz",
              ru: "Ваш заказ",
              crl: "Сизнинг буюртмангиз",
              style: AppStyle.w600s20h24DarkBluePrimary,
            ),
            12.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Translator(
                    uz: "Umumiy maxsulotlar narxi",
                    ru: "Общая стоимость товаров",
                    crl: "Умумий махсулотлар нархи",
                    style: AppStyle.w400s15h20DarkBlue300,
                  ),
                ),
                Expanded(
                  child: Translator(
                    uz:
                        "${Utils.cashFormat("${widget.data.totalAmount ?? 0}")} ${"sum".tr()}",
                    ru:
                        "${Utils.cashFormat("${widget.data.totalAmount ?? 0}")} ${"sum".tr()}",
                    crl:
                        "${Utils.cashFormat("${widget.data.totalAmount ?? 0}")} ${"sum".tr()}",
                    style: AppStyle.w600s18h22DarkBluePrimary,
                    maxLen: 4,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            12.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Translator(
                    uz: "Yetkazib berish",
                    ru: "Доставка",
                    crl: "Етказиб бериш",
                    style: AppStyle.w400s15h20DarkBlue300,
                  ),
                ),
                Expanded(
                  child: Translator(
                    uz: "Manzilga qarab farq qiladi",
                    ru: "Разница в зависимости от адреса",
                    crl: "Манзилга қараб фарқ қилади",
                    style: AppStyle.w600s18h22DarkBluePrimary,
                    maxLen: 4,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (widget.data.status != 4)
              ButtonWidget(
                text: "cancel".tr(),
                onTap: () {
                  SupportDialog.show(context);
                },
              ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
