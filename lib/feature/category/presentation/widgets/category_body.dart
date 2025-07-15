import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/widgets/search_view_delegate.dart';
import 'package:elaro_app/feature/home/presentation/blocs/categories/bloc/categories_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_package_for_height/my_package.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(
                productsBloc: context.read<ProductsBloc>(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Icon(Icons.search), 10.width, Text("Search")],
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.when(
                  loading:
                      () => Shimmer.fromColors(
                        baseColor: AppColor.lightGray200,
                        highlightColor: AppColor.lightGray500,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (ctx, index) {
                              return ZoomTapAnimation(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16.0,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.0,
                                        top: 8,
                                      ),
                                      child: Text("nkdfj", maxLines: 2),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  success: (data) {
                    var categories = data.data;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile();
                      },
                    );
                    // SizedBox(
                    //   height: 220,
                    //   child: ListView(
                    //     // scrollDirection: Axis.horizontal,
                    //     // clipBehavior: Clip.none,
                    //     children: [
                    //       ListView.builder(
                    //         shrinkWrap: true,
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: categories?.length ?? 0,
                    //         itemBuilder: (context, index) {
                    //           final category = categories?[index];
                    //           return ZoomTapAnimation(
                    //             onTap: () {
                    //               // context.push(
                    //               //   Routes.category,
                    //               //   extra: CategoryConstructorModel(
                    //               //     id: category?.id ?? 0,
                    //               //     titleUz: category?.nameUz ?? "",
                    //               //     titleRu: category?.nameRu ?? "",
                    //               //     titleCrl: category?.nameCrl ?? "",
                    //               //   ),
                    //               // );
                    //             },
                    //             child: Stack(
                    //               children: [
                    //                 Container(
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(
                    //                       16.0,
                    //                     ),
                    //                   ),
                    //                   child: CachedNetworkImage(
                    //                     imageUrl: category?.backgroundImg ?? "",
                    //                     fit: BoxFit.fitHeight,
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(
                    //                     left: 8.0,
                    //                     top: 8,
                    //                   ),
                    //                   child: Text(
                    //                     // maxLines: 2,
                    //                     category?.nameUz ?? "",
                    //                     style: const TextStyle(
                    //                       fontSize: 12,
                    //                       fontWeight: FontWeight.w400,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //       const SizedBox(width: 16),
                    //       GestureDetector(
                    //         onTap: () {
                    //           // MainSources.currentPage.value = 1;
                    //         },
                    //         child: Container(
                    //           width: 140,
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey[200],
                    //             borderRadius: BorderRadius.circular(8.0),
                    //           ),
                    //           child: const Center(
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Text("hammasi"),
                    //                 Icon(
                    //                   Icons.arrow_forward_ios_rounded,
                    //                   size: 14,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(width: 16),
                    //     ],
                    //   ),
                    // );
                  },
                  failure: (failure) => Text("Xatolik: $failure"),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
