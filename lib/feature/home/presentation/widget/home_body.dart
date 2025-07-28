import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/constants/app_shapes.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/source/main_source.dart';
import 'package:elaro_app/feature/home/presentation/blocs/banner/bloc/banner_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/brends/bloc/brends_bloc.dart';
import 'package:elaro_app/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:elaro_app/feature/home/presentation/screens/all_products.dart';
import 'package:elaro_app/feature/home/presentation/screens/brends.dart';
import 'package:elaro_app/feature/home/presentation/screens/hit_products.dart';
import 'package:elaro_app/feature/home/presentation/screens/home_banner.dart';
import 'package:elaro_app/feature/home/presentation/screens/home_category.dart';
import 'package:elaro_app/feature/home/presentation/screens/new_products.dart';
import 'package:elaro_app/feature/home/presentation/widget/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
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
                  preferredSize: Size.fromHeight(20),
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
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "search".tr(),
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, size: 24),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
        body: ListView(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            HomeBanner(),
            12.h,
            Text("popular".tr(), style: AppStyle.w600s17h22DarkBluePrimary),
            HomeCategory(),
            12.h,
            RowWidget(
              ontap: () {
                context.push(AppRouter.recomand);
              },
              category: "recomand",
            ),
            AllProducts(),
            12.h,
            Text("brand".tr(), style: AppStyle.w600s17h22DarkBluePrimary),
            12.h,
            Brends(),
            12.h,
            RowWidget(
              ontap: () {
                context.push(AppRouter.newProducts);
              },
              category: "new_products",
            ),
            12.h,
            NewProducts(),
            12.h,
            RowWidget(
              ontap: () {
                context.push(AppRouter.hitProduct);
              },
              category: "hit_product",
            ),
            12.h,
            HitProducts(),
          ],
        ),
      ),
    );
  }
}
