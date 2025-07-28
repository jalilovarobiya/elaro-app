import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/mapper/datum_to_product_model.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/app_error_widget.dart';
import 'package:elaro_app/core/widgets/product_item_widget.dart';
import 'package:elaro_app/core/widgets/shimmer_box.dart';
import 'package:elaro_app/feature/home/presentation/blocs/hit_products/bloc/hit_products_bloc.dart';
import 'package:elaro_app/feature/profile/data/model/product_constructor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class HitProducts extends StatefulWidget {
  const HitProducts({super.key});

  @override
  State<HitProducts> createState() => _HitProductsState();
}

class _HitProductsState extends State<HitProducts> {
  @override
  void initState() {
    context.read<HitProductsBloc>().add(HitProductsEvent.fetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HitProductsBloc, HitProductsState>(
      builder: (context, state) {
        return state.when(
          loading:
              () => Container(
                clipBehavior: Clip.none,
                height: 320,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
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
                                children: [
                                  ShimmerBox(),
                                  8.h,
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
                                  Spacer(),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [ShimmerBox(), ShimmerBox()],
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
              ),
          success:
              (data) => SizedBox(
                height: 350,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final product = data.data![index].toProductModel();
                    return ProductItemWidget(
                      ontap: () {
                        context.push(
                          AppRouter.product,
                          extra: ProductConstructorModel(
                            id: product.data?.id ?? 0,
                            titleUzb: "${product.data?.nameUz}",
                            titleRus: "${product.data?.nameRu}",
                            titleCrl: "${product.data?.nameCrl}",
                          ),
                        );
                      },
                      productData: product,
                    );
                  },
                ),
              ),
          failure: (failure) => AppErrorWidget(message: "error"),
        );
      },
    );
  }
}
