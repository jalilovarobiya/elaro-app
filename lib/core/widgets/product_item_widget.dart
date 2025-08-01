import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/feature/favorite/presentation/bloc/favourite_bloc.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/core/widgets/favourite_button.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/card/presentation/blocs/card/bloc/card_bloc.dart';
import 'package:elaro_app/feature/home/data/model/product_model.dart'
as product;
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductItemWidget extends StatefulWidget {
  final Function() ontap;
  final product.ProductModel productData;
  const ProductItemWidget({
    super.key,
    required this.ontap,
    required this.productData,
  });

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      key: ValueKey("product ${widget.productData.data?.id ?? 0}"),
      onTap: widget.ontap,
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColor.homeCategoryItem,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(16),
                    child:
                    (widget.productData.data?.images ?? []).isNotEmpty
                        ? Center(
                      child: CachedNetworkImage(
                        fit: BoxFit.fitWidth,
                        imageUrl:
                        widget
                            .productData
                            .data
                            ?.images
                            ?.firstOrNull
                            ?.image ??
                            "",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                              color: AppColor.primary,
                            ),
                        errorWidget:
                            (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    )
                        : SizedBox(),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: BlocBuilder<FavouriteBloc, FavouriteState>(
                      builder: (context, state) {
                        return state.whenOrNull(
                          allProduct: (data) {
                            final isSelected = data.any(
                                  (e) =>
                              e.productId ==
                                  widget.productData.data?.id.toString(),
                            );
                            return FavouriteButton(
                              ontap: () async {
                                if (!(await Utils().isLogin())) {
                                  CustomToast.showToast(
                                    context,
                                    AppImages.error,
                                    "required_login".tr(),
                                    Colors.white,
                                    Colors.red,
                                  );
                                }
                                if (isSelected) {
                                  context.read<FavouriteBloc>().add(
                                    FavouriteEvent.deleteProduct(
                                      widget.productData.data?.id ?? 0,
                                    ),
                                  );
                                } else {
                                  context.read<FavouriteBloc>().add(
                                    FavouriteEvent.addProduct(
                                      widget.productData.data!,
                                    ),
                                  );
                                }
                              },
                              isSelected: isSelected,
                            );
                          },
                        ) ??
                            SizedBox();
                      },
                    ),
                  ),
                  if ((widget.productData.data?.discountType ?? "").isNotEmpty)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.lightGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "sale".tr(),
                          style: AppStyle.w600s15h20DarkBluePrimary.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Translator(
                        uz: widget.productData.data?.nameUz ?? "",
                        ru: widget.productData.data?.nameRu ?? "",
                        crl: widget.productData.data?.nameCrl ?? "",
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "${Utils.cashFormat(widget.productData.data?.price ?? "")} ${"sum".tr()}",
                                style: AppStyle.w600s15h20DarkBluePrimary
                                    .copyWith(
                                  decoration:
                                  (widget
                                      .productData
                                      .data
                                      ?.discountType ??
                                      "")
                                      .isNotEmpty
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color:
                                  (widget
                                      .productData
                                      .data
                                      ?.discountType ??
                                      "")
                                      .isNotEmpty
                                      ? AppColor.lightGray50
                                      : AppColor.primaryDark,
                                ),
                              ),
                              if ((widget.productData.data?.discountType ?? "")
                                  .isNotEmpty)
                                Text(
                                  "${Utils.cashFormat((widget.productData.data?.discountedPrice ?? "").toString())} ${"sum".tr()}",
                                  style: AppStyle.w600s15h20DarkBluePrimary,
                                ),
                            ],
                          ),
                        ),
                        if (widget.productData.data?.qty != null &&
                            widget.productData.data?.qty != 0)
                          BlocBuilder<CardBloc, CardState>(
                            builder: (context, state) {
                              return state.when(
                                loading: () => SizedBox(),
                                success: (success, qty) {
                                  loading.value = false;
                                  bool isSelect = false;
                                  try {
                                    isSelect = success.any(
                                          (e) =>
                                      (e.id == widget.productData.data!.id),
                                    );
                                  } catch (e) {}
                                  return GestureDetector(
                                    onTap: () async {
                                      if (!(await Utils().isLogin())) {
                                        CustomToast.showToast(
                                          context,
                                          AppImages.error,
                                          "required_login".tr(),
                                          Colors.white,
                                          Colors.red,
                                        );
                                        return;
                                      }
                                      loading.value = true;
                                      if (isSelect) {
                                        context.read<CardBloc>().add(
                                          CardEvent.removeProduct(
                                            (widget.productData.data?.id ?? 0)
                                                .toString(),
                                          ),
                                        );
                                      } else {
                                        context.read<CardBloc>().add(
                                          CardEvent.addProduct(
                                            Datum(
                                              id: widget.productData.data!.id,
                                              qty:
                                              widget
                                                  .productData
                                                  .data!
                                                  .quantity ??
                                                  1,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color:
                                        isSelect
                                            ? AppColor.primary
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColor.primary,
                                        ),
                                      ),
                                      child: ValueListenableBuilder(
                                        valueListenable: loading,
                                        builder: (context, value, child) {
                                          if (value) {
                                            return Center(
                                              child: SizedBox(
                                                height: 24,
                                                width: 24,
                                                child:
                                                CircularProgressIndicator(
                                                  color:
                                                  isSelect
                                                      ? Colors.white
                                                      : AppColor
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          return Icon(
                                            isSelect
                                                ? Icons
                                                .shopping_cart_checkout_rounded
                                                : Icons.shopping_cart_outlined,
                                            size: 20,
                                            color:
                                            isSelect
                                                ? Colors.white
                                                : Colors.black,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                failure: () => SizedBox(),
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
