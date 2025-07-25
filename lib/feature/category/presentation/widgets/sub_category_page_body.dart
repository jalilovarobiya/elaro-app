import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/mapper/sub_category_to_product.dart';
import 'package:elaro_app/core/widgets/app_error_widget.dart';
import 'package:elaro_app/core/widgets/empty_widget.dart';
import 'package:elaro_app/core/widgets/product_item_widget.dart';
import 'package:elaro_app/feature/category/presentation/blocs/sub_category/bloc/sub_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryPageBody extends StatelessWidget {
  const SubCategoryPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryBloc, SubCategoryState>(
      builder: (context, state) {
        return state.when(
          loading:
              () => Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
          success: (data) {
            final products = data.data;
            if (products?.products?.isEmpty ?? true) {
              return EmptyWidget();
            }
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: products?.products?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.6,
              ),
              itemBuilder: (context, index) {
                final product = products?.products?[index];
                return ProductItemWidget(
                  ontap: () {},
                  productData: product!.toProductModel(),
                );
              },
            );
          },
          failure: (failure) => AppErrorWidget(message: "error"),
        );
      },
    );
  }
}
