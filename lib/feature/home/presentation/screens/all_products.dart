import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/widgets/shimmer_box.dart';
import 'package:elaro_app/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return state.when(
          loading:
              () => Container(
                clipBehavior: Clip.none,
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          AspectRatio(aspectRatio: 1, child: ShimmerBox()),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Shimmer.fromColors(
                                    baseColor: AppColor.lightGray400,
                                    highlightColor: AppColor.lightGray500,
                                    child: Container(
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Shimmer.fromColors(
                                    baseColor: AppColor.lightGray400,
                                    highlightColor: AppColor.lightGray500,
                                    child: Container(
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: AppColor.lightGray400,
                                        highlightColor: AppColor.lightGray500,
                                        child: Container(
                                          height: 20,
                                          width: 112,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: AppColor.lightGray400,
                                        highlightColor: AppColor.lightGray500,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          success:
              (data, filteredProducts, searchQuery, isSearching) => SizedBox(
                height: 350,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final product = data.data![index];
                    return ZoomTapAnimation(
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child:
                                        (product.images ?? []).isNotEmpty
                                            ? Center(
                                              child: CachedNetworkImage(
                                                fit: BoxFit.fitWidth,
                                                imageUrl:
                                                    product
                                                        .images
                                                        ?.firstOrNull
                                                        ?.image ??
                                                    "",
                                                progressIndicatorBuilder:
                                                    (context, url, progress) =>
                                                        CircularProgressIndicator(),
                                              ),
                                            )
                                            : SizedBox(),
                                  ),
                                  if ((product.discountType ?? "").isNotEmpty)
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text("discount"),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      product.nameUz.toString(),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text("${product.price} sum"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          failure: (failure) => Text("xatolik: $failure"),
        );
      },
    );
  }
}
