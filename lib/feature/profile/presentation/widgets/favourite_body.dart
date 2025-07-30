import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:elaro_app/core/mapper/card_to_product_model.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/empty_widget.dart';
import 'package:elaro_app/core/widgets/product_item_widget.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:elaro_app/feature/card/data/model/card_model.dart';
import 'package:elaro_app/feature/home/data/model/product_model.dart';
import 'package:elaro_app/feature/profile/data/model/product_constructor_model.dart';
import 'package:elaro_app/feature/profile/presentation/pages/favourite_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return state.when(
                loading: () => LoadingWidget(),
                allProduct: (List<CardModel> data) {
                  if (data.isEmpty) {
                    return SizedBox(
                      height: size.height - kToolbarHeight - 100,

                      child: FavoriteEmptyWidget(),
                    );
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1 / 1.6,
                        ),
                    itemBuilder: (context, index) {
                      final product = data[index];
                      return ProductItemWidget(
                        ontap: () {
                          context.push(
                            AppRouter.product,
                            extra: ProductConstructorModel(
                              id: int.parse(product.productId),
                              titleUzb: product.titleUz,
                              titleRus: product.titleRu,
                              titleCrl: product.titleCrl,
                            ),
                          );
                        },
                        productData: ProductModel(
                          data: product.toProductModel(),
                        ),
                      );
                    },
                  );
                },
                failure: () => EmptyWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
