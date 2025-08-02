import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/core/widgets/empty_widget.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:elaro_app/feature/card/presentation/blocs/card/bloc/card_bloc.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:elaro_app/feature/profile/data/model/product_constructor_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CardBody extends StatefulWidget {
  const CardBody({super.key});

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  List<Datum> cardList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            return state.when(
              loading: () => LoadingWidget(),
              success: (data, qty) {
                return _buildSuccessWidget(data, qty);
              },
              failure: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.grey,
                    ),
                    16.h,
                    Text(
                      "error_occurred".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    16.h,
                    ElevatedButton(
                      onPressed: () {
                        context.read<CardBloc>().add(
                              const CardEvent.fetchData(),
                            );
                      },
                      child: Text("retry".tr()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(List<Datum> data, int? qty) {
    if (data.isEmpty) {
      return EmptyWidget();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = data[index];
              return _buildCartItem(item);
            },
          ),
        ),
        _buildCartSummary(data, qty),
      ],
    );
  }

  Widget _buildCartItem(Datum item) {
    bool overProduct = (item.qty ?? 0) < (item.quantity ?? 0);

    return ZoomTapAnimation(
      onTap: () {
        context.push(
          AppRouter.product,
          extra: ProductConstructorModel(
            id: item.id ?? 0,
            titleUzb: "${item.nameUz}",
            titleRus: "${item.nameRu}",
            titleCrl: "${item.nameCrl}",
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: overProduct
              ? Border.all(color: Colors.red, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: item.images?.firstOrNull?.image ?? "",
                height: 80,
                width: 80,
                maxHeightDiskCache: 100,
                maxWidthDiskCache: 100,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
            12.h,
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (overProduct)
                    Text(
                      "end".tr(),
                      style: TextStyle(color: Colors.red),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Translator(
                          uz: item.nameUz ?? "",
                          ru: item.nameRu ?? "",
                          crl: item.nameCrl ?? "",
                          maxLen: 3,
                        ),
                      ),
                      Text(
                        "${"available".tr()}: ${Utils.cashFormat(item.qty.toString())}",
                        style: AppStyle.w400s15h20DarkBlue500,
                      ),
                    ],
                  ),
                  8.h,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.discountedPrice != null) ...[
                        Text(
                          "${Utils.cashFormat(item.price ?? "0")} ${"sum".tr()}",
                          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColor.lightGray50,
                            fontSize: 12,
                          ),
                        ),
                        8.h,
                        Text(
                          "${Utils.cashFormat(item.discountedPrice.toString())} ${"sum".tr()}",
                          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ] else
                        Text(
                          "${Utils.cashFormat(item.price ?? "0")} ${"sum".tr()}",
                          style: AppStyle.w600s15h20DarkBluePrimary,
                        ),
                    ],
                  ),
                  8.h,
                  Container(
                      decoration: AppStyle.lightGray400R16NoBorder.copyWith(
                        color: AppColor.lightGray300,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Translator(
                        uz: "730 000 so'mdan / 24 oy",
                        ru: "730 000 so'mdan / 24 oy",
                        crl: "730 000 сум на  24 месяца",
                        style: AppStyle.w500s13h18DarkBlue500.copyWith(
                          color: Colors.black,
                        ),
                      )),
                  20.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.lightGray300),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            ZoomTapAnimation(
                              onTap: () {
                                // if (overProduct) {
                                //   // return null;
                                // } else {
                                overProduct
                                    ? null
                                    : context.read<CardBloc>().add(
                                          CardEvent.updateQuantity(
                                            int.parse("${item.id ?? 0}")
                                                .toString(),
                                            (item.quantity ?? 0) + 1,
                                          ),
                                        );
                                // }
                              },
                              child: Text(
                                " + ",
                                style:
                                    AppStyle.w700s18h28DarkBluePrimary.copyWith(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                item.quantity.toString(),
                                style: AppStyle.w600s15h20DarkBluePrimary,
                              ),
                            ),
                            ZoomTapAnimation(
                              onTap: () {
                                context.read<CardBloc>().add(
                                      CardEvent.clearCart(
                                        int.parse("${item.id ?? 0}").toString(),
                                        (item.quantity ?? 0) - 1,
                                      ),
                                    );
                              },
                              child: Text(
                                " - ",
                                style:
                                    AppStyle.w600s15h20DarkBluePrimary.copyWith(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CardBloc>().add(
                                CardEvent.removeProduct(
                                    (item.id ?? 0).toString()),
                              );
                        },
                        icon: Icon(
                          CupertinoIcons.delete,
                          color: AppColor.lightGray700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary(List<Datum> data, int? qty) {
    cardList = data;
    if (cardList.isEmpty) return EmptyWidget();
    int totalCount = cardList.fold(
      0,
      (sum, item) => sum + (item.quantity ?? 0),
    );
    double totalPrice = cardList.fold(0.0, (sum, item) {
      double price = double.tryParse(item.price ?? "0") ?? 0;
      double discountedPrice = 0.0;
      String discountedPriceString = (item.discountedPrice?.toString() ?? "0");
      discountedPrice = double.tryParse(discountedPriceString) ?? 0;
      return sum +
          ((item.discountType != null) ? discountedPrice : price) *
              (item.quantity ?? 0);
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.lightGray500),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$totalCount ${"product".tr()}",
                style: AppStyle.w500s15h20Primary,
              ),
              Text(
                "${Utils.cashFormat(totalPrice.toString())} ${"sum".tr()}",
                style: AppStyle.w500s15h20Primary,
              ),
            ],
          ),
          8.h,
          Divider(thickness: 0.5),
          8.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("total".tr(), style: AppStyle.w600s18h22DarkBluePrimary),
              Text(
                "${Utils.cashFormat(totalPrice.toString())} ${"sum".tr()}",
                style: AppStyle.w600s18h22DarkBluePrimary,
              ),
            ],
          ),
          16.h,
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                final request = await Utils().isLogin();
                if (request) {
                  if (totalPrice < (qty ?? 2000000)) {
                    print(qty);
                    CustomToast.showToast(
                      context,
                      AppImages.error,
                      "required_min_price".tr(
                        args: [Utils.cashFormat(qty.toString())],
                        namedArgs: {
                          "minPrice": Utils.cashFormat(qty.toString()),
                        },
                      ),
                      Colors.white,
                      Colors.red,
                    );
                    return;
                  }
                  final overProduct = cardList.any(
                    (e) => (e.qty ?? 0) < (e.quantity ?? 0),
                  );
                  if (overProduct) {
                    CustomToast.showToast(
                      context,
                      AppImages.error,
                      "have_over_products".tr(),
                      Colors.white,
                      Colors.red,
                    );
                    return;
                  }
                  context.push(AppRouter.orderScreen, extra: cardList);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "checkout".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
