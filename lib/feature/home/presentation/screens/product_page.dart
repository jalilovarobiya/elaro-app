import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/mapper/datum_to_product_model.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/feature/category/presentation/blocs/category/bloc/category_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/product/bloc/product_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:elaro_app/feature/home/presentation/widget/product_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final int id;
  final String titleUzb;
  final String titleRus;
  final String titleCrl;

  const ProductPage({
    super.key,
    required this.id,
    required this.titleUzb,
    required this.titleRus,
    required this.titleCrl,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          titleUz: widget.titleUzb,
          titleRu: widget.titleRus,
          titleCrl: widget.titleCrl,
          action: [
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                return state.whenOrNull(
                      success: (data) {
                        return BlocBuilder<FavouriteBloc, FavouriteState>(
                          builder: (context, state) {
                            return state.whenOrNull(
                                  allProduct: (date) {
                                    final isSelected = date.any(
                                      (e) =>
                                          e.productId == widget.id.toString(),
                                    );
                                    return IconButton(
                                      icon: Icon(
                                        isSelected
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
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
                                              widget.id ?? 0,
                                            ),
                                          );
                                        } else {
                                          context.read<FavouriteBloc>().add(
                                            FavouriteEvent.addProduct(
                                              ((data.data ?? [])
                                                  .firstWhere(
                                                    (e) => e.id == widget.id,
                                                  )
                                                  .toProductModel()
                                                  .data!),
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
                        );
                      },
                    ) ??
                    SizedBox();
              },
            ),
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (productModel) => ProductBody(product: productModel),

              failure: (message) => Center(child: Text("Xatolik: $message")),
            );
          },
        ),
      ),
    );
  }

  _getData() async {
    context.read<ProductBloc>().add(ProductEvent.fetchData(widget.id));
  }
}
