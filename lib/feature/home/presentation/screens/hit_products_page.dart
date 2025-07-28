import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/mapper/datum_to_product_model.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/app_error_widget.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/core/widgets/product_item_widget.dart';
import 'package:elaro_app/core/widgets/shimmer_box.dart';
import 'package:elaro_app/feature/home/presentation/blocs/hit_products/bloc/hit_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class HitProductsPage extends StatelessWidget {
  const HitProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleUz: "Omabop mahsulotlar",
        titleRu: "Хит продукты",
        titleCrl: "Омабоп маҳсулотлар",
      ),
      body: BlocBuilder<HitProductsBloc, HitProductsState>(
        builder: (context, state) {
          return state.when(
            loading:
                () => GridView.builder(
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.6,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Shimmer.fromColors(
                              baseColor: AppColor.lightGray400,
                              highlightColor: AppColor.lightGray500,
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ShimmerBox(),
                                  8.h,
                                  ShimmerBox(),
                                  Spacer(),
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
                                  8.h,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            success:
                (data) => SizedBox(
                  child: GridView.builder(
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 150,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.6,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemCount: data.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = data.data![index].toProductModel();
                      return ProductItemWidget(
                        ontap: () {
                          context.push(AppRouter.product);
                        },
                        productData: product,
                      );
                    },
                  ),
                ),
            failure: (failure) => AppErrorWidget(message: "error"),
          );
        },
      ),
    );
  }
}
