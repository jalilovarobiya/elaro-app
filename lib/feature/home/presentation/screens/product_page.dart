import 'package:elaro_app/core/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
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
                            return state.when(
                              loading: () => SizedBox(),
                              allProduct: (allProduct) {
                                final isSelected = allProduct.any(
                                  (e) => e.productId == widget.id,
                                );
                                return IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    isSelected
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                  ),
                                );
                              },
                              failure: () => SizedBox(),
                            );
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
              success: (productModel) {
                return ProductBody(product: productModel);
              },
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
