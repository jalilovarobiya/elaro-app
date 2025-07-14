import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arxitekture/core/constants/app_colors.dart';
import 'package:clean_arxitekture/core/constants/app_images.dart';
import 'package:clean_arxitekture/core/constants/app_shapes.dart';
import 'package:clean_arxitekture/core/routes/app_routes.dart';
import 'package:clean_arxitekture/core/source/main_source.dart';
import 'package:clean_arxitekture/core/widgets/shimmer_box.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/banner/bloc/banner_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/brends/bloc/brends_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/hit_products/bloc/hit_products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/new_products/bloc/new_products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/screens/home_banner.dart';
import 'package:clean_arxitekture/feature/home/presentation/screens/home_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_package_for_height/my_package.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final ProductsBloc _productsBloc;

  @override
  void dispose() {
    _productsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.transparent,
      color: AppColor.primary,
      elevation: 0,
      displacement: 300,
      onRefresh: () async {
        context.read<BannerBloc>().add(BannerEvent.fetchData());
        context.read<ProductsBloc>().add(ProductsEvent.fetchData());
        context.read<BrendsBloc>().add(BrendsEvent.fetchData());
      },
      child: NestedScrollView(
        controller: MainSources.scrollController,
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                scrolledUnderElevation: 0,
                elevation: 0,
                expandedHeight: 120,
                collapsedHeight: kToolbarHeight,
                backgroundColor: AppColor.primary,
                shape: AppShapes.bottom20,
                title: AnimatedOpacity(
                  opacity: innerBoxIsScrolled ? 0 : 1,
                  duration: Duration(milliseconds: 200),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.logo,
                      color: Colors.white,
                      height: 20,
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                      left: 12,
                      bottom: 16,
                    ),
                    child: InkWell(
                      onTap: () {
                        context.push(AppRouter.search);
                      },
                      child: Ink(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              10.width,
                              Text("Search"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            HomeBanner(),
            12.height,
            HomeCategory(),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                return state.when(
                  loading:
                      () => Container(
                        clipBehavior: Clip.none,
                        height: 320,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              width: 200,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: ShimmerBox(),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Shimmer.fromColors(
                                            baseColor: AppColor.lightGray400,
                                            highlightColor:
                                                AppColor.lightGray500,
                                            child: Container(
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Shimmer.fromColors(
                                            baseColor: AppColor.lightGray400,
                                            highlightColor:
                                                AppColor.lightGray500,
                                            child: Container(
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Shimmer.fromColors(
                                                baseColor:
                                                    AppColor.lightGray400,
                                                highlightColor:
                                                    AppColor.lightGray500,
                                                child: Container(
                                                  height: 20,
                                                  width: 112,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Shimmer.fromColors(
                                                baseColor:
                                                    AppColor.lightGray400,
                                                highlightColor:
                                                    AppColor.lightGray500,
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
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
                            final product = data.data![index];
                            return ZoomTapAnimation(
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child:
                                                (product.images ?? [])
                                                        .isNotEmpty
                                                    ? Center(
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.fitWidth,
                                                        imageUrl:
                                                            product
                                                                .images
                                                                ?.firstOrNull
                                                                ?.image ??
                                                            "",
                                                        progressIndicatorBuilder:
                                                            (
                                                              context,
                                                              url,
                                                              progress,
                                                            ) =>
                                                                CircularProgressIndicator(),
                                                      ),
                                                    )
                                                    : SizedBox(),
                                          ),
                                          if ((product.discountType ?? "")
                                              .isNotEmpty)
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppColor.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text("discount"),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              product.nameUz.toString(),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text("${product.price} sum"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  failure: (failure) => Text("xatolik: $failure"),
                );
              },
            ),
            12.height,
            Text("Ommabop brendlar"),
            12.height,
            SizedBox(
              height: 60,
              child: BlocBuilder<BrendsBloc, BrendsState>(
                builder: (context, state) {
                  return state.when(
                    loading:
                        () => ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return ShimmerBox();
                          },
                        ),
                    success:
                        (data) => ListView.builder(
                          itemCount: data.data?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ZoomTapAnimation(
                              child: Container(
                                width: 100,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: data.data?[index].image ?? "",
                                      fit: BoxFit.fitHeight,
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    failure: (failure) => SizedBox(),
                  );
                },
              ),
            ),
            12.height,
            Text("Yangi mahsulotlar"),
            12.height,
            BlocBuilder<NewProductsBloc, NewProductsState>(
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
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: ShimmerBox(),
                                    // child: Shimmer.fromColors(
                                    //   baseColor: AppColor.lightGray400,
                                    //   highlightColor: AppColor.lightGray500,
                                    //   child: Container(
                                    //     alignment: Alignment.center,
                                    //     margin: EdgeInsets.all(10),
                                    //     padding: EdgeInsets.all(16),
                                    //     decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //         16,
                                    //       ),
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ShimmerBox(),
                                          8.height,
                                          Shimmer.fromColors(
                                            baseColor: AppColor.lightGray400,
                                            highlightColor:
                                                AppColor.lightGray500,
                                            child: Container(
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
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
                                            children: [
                                              ShimmerBox(),
                                              ShimmerBox(),
                                            ],
                                          ),
                                          8.height,
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
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final product = data.data![index];
                            return ZoomTapAnimation(
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child:
                                                (product.images ?? [])
                                                        .isNotEmpty
                                                    ? Center(
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.fitWidth,
                                                        imageUrl:
                                                            product
                                                                .images
                                                                ?.firstOrNull
                                                                ?.image ??
                                                            "",
                                                        progressIndicatorBuilder:
                                                            (
                                                              context,
                                                              url,
                                                              progress,
                                                            ) =>
                                                                CircularProgressIndicator(),
                                                      ),
                                                    )
                                                    : SizedBox(),
                                          ),
                                          Positioned(
                                            top: 6,
                                            right: 6,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite_outline,
                                              ),
                                            ),
                                          ),
                                          if ((product.discountType ?? "")
                                              .isNotEmpty)
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppColor.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text("discount"),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              product.nameUz.toString(),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text("${product.price} sum"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  failure: (failure) => Text("xatolik: $failure"),
                );
              },
            ),
            12.height,
            Text("Hit mahsulotlar"),
            12.height,
            BlocBuilder<HitProductsBloc, HitProductsState>(
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
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: ShimmerBox(),
                                    // child: Shimmer.fromColors(
                                    //   baseColor: AppColor.lightGray400,
                                    //   highlightColor: AppColor.lightGray500,
                                    //   child: Container(
                                    //     alignment: Alignment.center,
                                    //     margin: EdgeInsets.all(10),
                                    //     padding: EdgeInsets.all(16),
                                    //     decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //         16,
                                    //       ),
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ShimmerBox(),
                                          8.height,
                                          Shimmer.fromColors(
                                            baseColor: AppColor.lightGray400,
                                            highlightColor:
                                                AppColor.lightGray500,
                                            child: Container(
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
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
                                            children: [
                                              ShimmerBox(),
                                              ShimmerBox(),
                                            ],
                                          ),
                                          8.height,
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
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final product = data.data![index];
                            return ZoomTapAnimation(
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child:
                                                (product.images ?? [])
                                                        .isNotEmpty
                                                    ? Center(
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.fitWidth,
                                                        imageUrl:
                                                            product
                                                                .images
                                                                ?.firstOrNull
                                                                ?.image ??
                                                            "",
                                                        progressIndicatorBuilder:
                                                            (
                                                              context,
                                                              url,
                                                              progress,
                                                            ) =>
                                                                CircularProgressIndicator(),
                                                      ),
                                                    )
                                                    : SizedBox(),
                                          ),
                                          Positioned(
                                            top: 6,
                                            right: 6,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite_outline,
                                              ),
                                            ),
                                          ),
                                          if ((product.discountType ?? "")
                                              .isNotEmpty)
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppColor.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text("discount"),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              product.nameUz.toString(),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text("${product.price} sum"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  failure: (failure) => Text("xatolik: $failure"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
