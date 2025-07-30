import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/app_error_widget.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:elaro_app/feature/category/data/model/category_constructr.dart';
import 'package:elaro_app/feature/category/data/model/sub_category_constructr_model.dart';
import 'package:elaro_app/feature/category/presentation/blocs/search/bloc/search_bloc.dart';
import 'package:elaro_app/feature/profile/data/model/product_constructor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalSearchBody extends StatefulWidget {
  const GlobalSearchBody({super.key});

  @override
  State<GlobalSearchBody> createState() => _GlobalSearchBodyState();
}

class _GlobalSearchBodyState extends State<GlobalSearchBody> {
  Timer? time;

  TextEditingController controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    time?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: StatefulBuilder(
                  builder: (context, state) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onChanged: (value) {
                        _timer(value);
                        state(() {});
                      },
                      decoration: InputDecoration(
                        hintText: "search".tr(),
                        prefixIcon: Icon(Icons.search),
                        suffix:
                            controller.text.isEmpty
                                ? SizedBox()
                                : ZoomTapAnimation(
                                  onTap: () => controller.clear(),
                                  child: Icon(Icons.cancel_outlined),
                                ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: ZoomTapAnimation(
                  onTap: () => context.pop(),
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    child: Text("cancel".tr(), textAlign: TextAlign.center),
                  ),
                ),
              ),
              12.h,
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => SizedBox(),
                    loading: () => LoadingWidget(),
                    success: (data) {
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.categories?.length ?? 0,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.push(
                                    AppRouter.category,
                                    extra: CategoryConstructorModel(
                                      id: data.categories?[index].id ?? 0,
                                      titleUz:
                                          data.categories?[index].nameUz ?? "",
                                      titleCrl:
                                          data.categories?[index].nameCrl ?? "",
                                      titleRu:
                                          data.categories?[index].nameRu ?? "",
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      margin: EdgeInsets.symmetric(vertical: 2),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.widgets_outlined),
                                    ),
                                    6.h,
                                    Text(data.categories?[index].nameUz ?? ""),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.subCategories?.length ?? 0,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.push(
                                    AppRouter.subCategory,
                                    extra: SubCategoryConstructorModel(
                                      id: data.subCategories?[index].id ?? 0,
                                      titleUz:
                                          data.subCategories?[index].nameUz ??
                                          "",
                                      titleCrl:
                                          data.subCategories?[index].nameCrl ??
                                          "",
                                      titleRu:
                                          data.subCategories?[index].nameRu ??
                                          "",
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      margin: EdgeInsets.symmetric(vertical: 2),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.widgets_outlined),
                                    ),
                                    6.h,
                                    Text(
                                      data.subCategories?[index].nameUz ?? "",
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.products?.length ?? 0,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.push(
                                    AppRouter.product,
                                    extra: ProductConstructorModel(
                                      id: data.products?[index].id ?? 0,
                                      titleUzb:
                                          data.products?[index].nameUz ?? "",
                                      titleCrl:
                                          data.products?[index].nameCrl ?? "",
                                      titleRus:
                                          data.products?[index].nameRu ?? "",
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      margin: EdgeInsets.symmetric(vertical: 2),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            data
                                                .products?[index]
                                                .images?[0]
                                                .imageUrl ??
                                            "",
                                        progressIndicatorBuilder:
                                            (
                                              context,
                                              url,
                                              downloadProgress,
                                            ) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        errorWidget:
                                            (context, url, error) => SizedBox(),
                                      ),
                                    ),
                                    6.h,
                                    Text(data.products?[index].nameUz ?? ""),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                    failure: (failure) => AppErrorWidget(message: "error"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _timer(String value) {
    time?.cancel();
    time = Timer(Duration(seconds: 2), () {
      setState(() {
        context.read<SearchBloc>().add(SearchEvent.search(text: value));
      });
    });
  }
}
