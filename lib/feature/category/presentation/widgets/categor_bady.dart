import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/mapper/category_to_product.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/app_error_widget.dart';
import 'package:elaro_app/core/widgets/empty_widget.dart';
import 'package:elaro_app/core/widgets/product_item_widget.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/category/data/model/sub_category_constructr_model.dart';
import 'package:elaro_app/feature/category/presentation/blocs/category/bloc/category_bloc.dart';
import 'package:elaro_app/feature/home/data/model/category_model.dart';
import 'package:elaro_app/feature/profile/data/model/product_constructor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryBody extends StatefulWidget {
  final CategoryBloc bloc;
  final int id;
  const CategoryBody({super.key, required this.bloc, required this.id});

  @override
  State<CategoryBody> createState() => _CategorBadyState();
}

class _CategorBadyState extends State<CategoryBody> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(CategoryEvent.fetchData(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.when(
          loading:
              () => Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
          success: (
            CategoryModel data,
            List<String> color,
            String selectedColor,
            String minPrice,
            String maxPrice,
          ) {
            if ((data.data?.subCategories?.length ?? 0) == 0) {
              return EmptyWidget();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  12.h,
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: data.data?.subCategories?.length ?? 0,
                      itemBuilder: (context, index) {
                        final subCategory = data.data?.subCategories?[index];
                        return ZoomTapAnimation(
                          onTap:
                              () => context.push(
                                AppRouter.subCategory,
                                extra: SubCategoryConstructorModel(
                                  id: subCategory?.id ?? 0,
                                  titleUz: subCategory?.nameUz ?? "",
                                  titleCrl: subCategory?.nameCrl ?? "",
                                  titleRu: subCategory?.nameRu ?? "",
                                ),
                              ),
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.only(right: 12, left: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                if (subCategory?.nameUz != null)
                                  SizedBox(
                                    height: 60,
                                    width: 50,
                                    child: CachedNetworkImage(
                                      imageUrl: subCategory?.image ?? "",
                                      fit: BoxFit.contain,
                                      errorWidget: (context, _, __) {
                                        return SvgPicture.network(
                                          subCategory?.image ?? "",
                                          color: Colors.black,
                                          errorBuilder: (context, _, __) {
                                            return const SizedBox();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (subCategory?.nameUz != null)
                                  const SizedBox(width: 12),
                                Translator(
                                  uz: subCategory?.nameUz ?? "",
                                  ru: subCategory?.nameRu ?? "",
                                  crl: subCategory?.nameCrl ?? "",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  12.h,
                  Expanded(
                    child: GridView.builder(
                      itemCount: data.data?.products?.length ?? 0,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.6,
                        mainAxisSpacing: 10,
                      ),
                      padding: EdgeInsets.only(bottom: 150),
                      itemBuilder: (contex, index) {
                        final product = data.data?.products?[index];
                        return ProductItemWidget(
                          ontap: () {
                            context.push(
                              AppRouter.product,
                              extra: ProductConstructorModel(
                                id: product.id ?? 0,
                                titleUzb: "${product.nameUz}",
                                titleRus: "${product.nameRu}",
                                titleCrl: "${product.nameCrl}",
                              ),
                            );
                          },
                          productData: product!.toProductModel(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          failure: (failure) => AppErrorWidget(message: "error"),
        );
      },
    );
  }
}
