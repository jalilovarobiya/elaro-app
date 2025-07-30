import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/app_error_widget.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:elaro_app/feature/category/data/model/category_constructr.dart';
import 'package:elaro_app/feature/category/presentation/blocs/categories/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesBloc>().add(CategoriesEvent.fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return state.when(
          loading: () => LoadingWidget(),
          success: (data) {
            var categories = data.data;
            return LiquidPullToRefresh(
              backgroundColor: AppColor.primary,
              color: Colors.white,
              showChildOpacityTransition: false,
              onRefresh: () async => _fetchData(),
              child: ListView.builder(
                itemCount: categories?.length ?? 0,
                itemBuilder: (context, index) {
                  final category = categories?[index];
                  return ListTile(
                    onTap: () {
                      context.push(
                        AppRouter.category,
                        extra: CategoryConstructorModel(
                          id: category?.id ?? 0,
                          titleUz: category?.nameUz ?? "",
                          titleRu: category?.nameRu ?? "",
                          titleCrl: category?.nameCrl ?? "",
                        ),
                      );
                    },
                    leading: SizedBox(
                      height: 24,
                      width: 24,
                      child: CachedNetworkImage(
                        imageUrl: category?.image ?? "",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CircleAvatar(),
                        errorWidget: (context, url, error) {
                          try {
                            return SvgPicture.network(
                              category?.image ?? "",
                              color: Colors.black,
                              height: 30,
                              width: 30,
                            );
                          } catch (e) {
                            return Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColor.primaryDark,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    title: Translator(
                      uz: category?.nameUz ?? "",
                      ru: category?.nameRu ?? "",
                      crl: category?.nameCrl ?? "",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColor.lightGray600,
                    ),
                  );
                },
              ),
            );
          },
          failure: (failure) => AppErrorWidget(message: "error"),
        );
      },
    );
  }

  _fetchData() {
    context.read<CategoriesBloc>().add(CategoriesEvent.fetchData());
  }
}
