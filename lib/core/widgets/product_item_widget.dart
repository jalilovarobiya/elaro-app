import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductItemWidget extends StatefulWidget {
  final Function() ontap;
  final productData;
  const ProductItemWidget({super.key, required this.ontap, this.productData});

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
