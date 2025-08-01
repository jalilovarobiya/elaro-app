import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/mapper/category_to_product.dart';
import 'package:elaro_app/core/widgets/product_item_widget.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/source/main_source.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../auth/presentation/widgets/button_widget.dart';
import '../../../auth/presentation/widgets/loading_widget.dart';
import '../../../card/presentation/blocs/card/bloc/card_bloc.dart';
import '../../../category/presentation/blocs/category/bloc/category_bloc.dart';
import '../../../profile/data/model/product_constructor_model.dart';

import '../../data/model/product_model.dart';
import 'image_view_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  final ValueNotifier<int> _pageNotifier = ValueNotifier(0);
  final ScrollController controller = ScrollController();
  ValueNotifier<bool> isScrolled = ValueNotifier(false);
  bool readMore = false;
  bool atrebute = false;

  @override
  void initState() {
    isScrolling();
    context
        .read<CategoryBloc>()
        .add(CategoryEvent.fetchData(id: widget.product.data?.categoryId ?? 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageList = widget.product.data?.images?.map((e) => e.image).toList();
    final attributes = widget.product.data?.attributes;
    final attributesLen = atrebute
        ? (attributes?.length ?? 0)
        : ((attributes?.length ?? 0) > 3 ? 3 : (attributes?.length ?? 0));

    String description(
      String lang,
    ) {
      final desc = lang == "uz"
          ? widget.product.data?.descriptionUz ?? ""
          : lang == "ru"
              ? widget.product.data?.descriptionRu ?? ""
              : widget.product.data?.descriptionCrl ?? "";
      if (readMore || desc.length <= 500) {
        return "${desc.substring(0, 500)}.";
      }
      return desc;
    }

    // String seeAllAtrebutes(String lang, int index) {
    //   final desc = lang == "uz"
    //       ? "${attributes?[index].nameUz}"
    //       : lang == "ru"
    //           ? "${attributes?[index].nameRu}"
    //           : "${attributes?[index].nameCrl}";
    //   if (atrebute || desc.length == 3) {
    //     return desc;
    //   }
    //   return desc;
    // }

    return Stack(
      children: [
        ListView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              color: AppColor.lightGray200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CarouselSlider(
                items: List.generate(imageList?.length ?? 0, (generator) {
                  final _image = imageList?[generator] ?? "";
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ZoomTapAnimation(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ImageViewPage(url: _image)));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: _image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }),
                options: CarouselOptions(
                  height: size.height * 0.4,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  clipBehavior: Clip.none,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0,
                  onPageChanged: (index, reason) => _pageNotifier.value = index,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            10.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListenableBuilder(
                listenable: _pageNotifier,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(imageList?.length ?? 0, (generator) {
                      final isSelect = _pageNotifier.value == generator;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                        child: isSelect
                            ? Icon(Icons.circle, size: 8, color: AppColor.black)
                                .animate()
                                .fade(duration: GetNumUtils(300).milliseconds)
                            : const Icon(
                                Icons.circle,
                                size: 8,
                                color: AppColor.lightGray500,
                              )
                                .animate()
                                .fade(duration: GetNumUtils(300).milliseconds),
                      );
                    }),
                  );
                },
              ),
            ),
            10.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "${StringTranslateExtension("available").tr()}: ${widget.product.data?.qty ?? "0"}",
                    style: AppStyle.w400s13h18DarkBlue300
                        .copyWith(color: AppColor.lightGreen),
                  ),
                  const Spacer(),
                  Text(
                    "${StringTranslateExtension("code").tr()}: ${(widget.product.data?.id ?? "").toString().padLeft(6, '0')}",
                    style: AppStyle.w400s13h18DarkBlue300,
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text: (widget.product.data?.id ?? "")
                              .toString()
                              .padLeft(6, '0')));
                    },
                    icon: const Icon(
                      Icons.copy,
                      color: AppColor.darkBlue500,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
            16.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Translator(
                uz: widget.product.data?.nameUz ?? "",
                ru: widget.product.data?.nameRu ?? "",
                crl: widget.product.data?.nameCrl ?? "",
                style: AppStyle.w500s15h20DarkBlue500
                    .copyWith(fontSize: 18, color: AppColor.primaryDark),
              ),
            ),
            20.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(StringTranslateExtension("color").tr(),
                  style: AppStyle.w400s15h20DarkBlue500
                      .copyWith(color: AppColor.primaryDark)),
            ),
            10.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    decoration:
                        AppStyle.colorBox(widget.product.data?.color ?? ""),
                    height: 44,
                    width: 44,
                  ),
                ],
              ),
            ),
            16.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: AppStyle.cardBox,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "${Utils.cashFormat(widget.product.data?.price ?? "")} ${StringTranslateExtension("sum").tr()}",
                      style: AppStyle.w600s17h22DarkBluePrimary.copyWith(
                          decoration: (widget.product.data?.discountType ?? "")
                                  .isNotEmpty
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: (widget.product.data?.discountType ?? "")
                                  .isNotEmpty
                              ? AppColor.lightGray50
                              : AppColor.primaryDark),
                    ),
                    if ((widget.product.data?.discountType ?? "").isNotEmpty)
                      Text(
                        "${Utils.cashFormat((widget.product.data?.discountedPrice ?? "0").toString())} ${StringTranslateExtension("sum").tr()}",
                        style: AppStyle.w600s17h22DarkBluePrimary,
                      ),
                    const SizedBox(height: 12),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: AppStyle.lightGray100R14B1White,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () => const LoadingWidget(),
                          success: (data, minPrice) {
                            final isHave = data
                                .any((e) => e.id == widget.product.data?.id);
                            return ButtonWidget(
                              textColor: AppColor.white,
                              text: isHave
                                  ? StringTranslateExtension("go_card").tr()
                                  : StringTranslateExtension("add_card").tr(),
                              onTap: () async {
                                if (!(await Utils().isLogin())) {
                                  CustomToast.showToast(
                                      context,
                                      AppImages.error,
                                      StringTranslateExtension("required_login")
                                          .tr(),
                                      AppColor.white,
                                      AppColor.red);
                                }
                                if (isHave) {
                                  GoRouter.of(context)
                                      .go(AppRouter.card, extra: 3);
                                  MainSources.currentPage.value = 2;
                                } else {
                                  context.read<CardBloc>().add(
                                        CardEvent.addProduct(
                                          Datum(
                                              id: widget.product.data!.id,
                                              qty: (widget.product.data!
                                                          .quantity ??
                                                      0) +
                                                  1),
                                        ),
                                      );
                                }
                              },
                            );
                          },
                          failure: () => const SizedBox(),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    const Divider(thickness: 0.3, height: 1),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push(AppRouter.location);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: AppColor.lightGray500)),
                child: ListTile(
                  leading: SvgPicture.network(
                      "https://texnomart.uz/_nuxt/img/store-small.4aacca3.svg"),
                  title: Translator(
                    uz: "Do'kondan olib ketish bepul",
                    ru: "Бесплатный вынос из магазина",
                    crl: "Дўкондан олиб кетиш бепул",
                    style: AppStyle.w500s15h20Primary,
                  ),
                  subtitle: Translator(
                    uz: "1ta do'konda naqt pul bilan mavjud",
                    ru: "Доступно в 1 магазинах наличными",
                    crl: "1та дўконда нақт пул билан мавжуд",
                    style: AppStyle.w400s15h20DarkBlue500
                        .copyWith(color: AppColor.lightBlue300),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                dense: false,
                contentPadding: EdgeInsets.zero,
                title: Text(StringTranslateExtension("description").tr(),
                    style: AppStyle.w600s15h20DarkBluePrimary),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    12.h,
                    Translator(
                      maxLen: readMore ? null : 20,
                      uz: description("uz"),
                      ru: description("ru"),
                      crl: description("crl"),
                    ),
                    if ((widget.product.data?.descriptionUz ?? "").length > 500 ||
                        (widget.product.data?.descriptionRu ?? "").length >
                            500 ||
                        (widget.product.data?.descriptionCrl ?? "").length >
                            500)
                      ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            readMore = !readMore;
                          });
                        },
                        child: Text(
                          readMore
                              ? StringTranslateExtension("read_more").tr()
                              : StringTranslateExtension("read_less").tr(),
                          style: AppStyle.w500s15h20Primary
                              .copyWith(color: AppColor.blue),
                        ),
                      )
                  ],
                ),
              ),
            ),
            16.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                StringTranslateExtension("features").tr(),
                style: AppStyle.w500s15h20DarkBlue500
                    .copyWith(fontSize: 18, color: AppColor.primaryDark),
              ),
            ),
            ...List.generate(
              attributesLen,
              (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Translator(
                          uz: "${attributes?[index].nameUz}",
                          ru: "${attributes?[index].nameRu}",
                          crl: "${attributes?[index].nameCrl}",
                          style: AppStyle.w400s15h20DarkBlue500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Translator(
                          uz: "${attributes?[index].valueUz}",
                          ru: "${attributes?[index].valueRu}",
                          crl: "${attributes?[index].valueCrl}",
                          style: AppStyle.w400s15h20DarkBlue500,
                          maxLen: 2,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if ((attributes?.length ?? 0) > 3)
              ZoomTapAnimation(
                onTap: () {
                  setState(() {
                    atrebute = !atrebute;
                  });
                },
                child: Container(
                  color: AppColor.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Text(
                    atrebute
                        ? StringTranslateExtension("hide_features").tr()
                        : StringTranslateExtension("all_features").tr(),
                    style: AppStyle.w500s15h20Primary
                        .copyWith(color: AppColor.blue),
                  ),
                ),
              ),
            Container(
              color: AppColor.lightGray200,
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(StringTranslateExtension("accessories").tr(),
                  style: AppStyle.w600s17h22DarkBluePrimary),
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(),
              clipBehavior: Clip.none,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return state.whenOrNull(success: (success, _, __, a, b) {
                        return ListView.builder(
                          itemCount: success.data?.products?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductItemWidget(
                              productData: success.data?.products?[index]
                                  .toProductModel(),
                              ontap: () {
                                context.push(
                                  AppRouter.product,
                                  extra: ProductConstructorModel(
                                    id: success.data?.products?[index].id ?? 0,
                                    titleUzb:
                                        success.data?.products?[index].nameUz ??
                                            "",
                                    titleRus:
                                        success.data?.products?[index].nameRu ??
                                            "",
                                    titleCrl: success
                                            .data?.products?[index].nameCrl ??
                                        "",
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }) ??
                      const SizedBox();
                },
              ),
            ),
            const SizedBox(height: 150),
          ],
        ),
        ValueListenableBuilder(
            valueListenable: isScrolled,
            builder: (context, value, _) {
              if (!value) {
                return const SizedBox();
              }
              return Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 20, bottom: 30, top: 10),
                    height: 100,
                    decoration:
                        const BoxDecoration(color: AppColor.white, boxShadow: [
                      BoxShadow(
                        color: AppColor.lightGray500,
                        offset: Offset(0, 1),
                        blurRadius: 20,
                      )
                    ]),
                    child: BlocBuilder<CardBloc, CardState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () => const LoadingWidget(),
                          success: (data, minPrice) {
                            final isHave = data
                                .any((e) => e.id == widget.product.data?.id);
                            return ButtonWidget(
                              textColor: AppColor.white,
                              text: isHave
                                  ? StringTranslateExtension("go_card").tr()
                                  : StringTranslateExtension("add_card").tr(),
                              onTap: () async {
                                if (!(await Utils().isLogin())) {
                                  CustomToast.showToast(
                                      context,
                                      AppImages.error,
                                      StringTranslateExtension("required_login")
                                          .tr(),
                                      AppColor.white,
                                      AppColor.red);
                                }
                                if (isHave) {
                                  GoRouter.of(context)
                                      .go(AppRouter.home, extra: 2);
                                } else {
                                  context.read<CardBloc>().add(
                                      CardEvent.addProduct(Datum(
                                          id: widget.product.data!.id,
                                          qty: widget.product.data?.quantity ??
                                              1)));
                                }
                              },
                            );
                          },
                          failure: () => const SizedBox(),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  // void _available() {
  //   context.push(
  //     AppRouter.description,
  //     extra: DescriptionConstructorModel(
  //       textUz: widget.product.data?.descriptionUz ?? "",
  //       textRu: widget.product.data?.descriptionRu ?? "",
  //       textCrl: widget.product.data?.descriptionCrl ?? "",
  //     ),
  //   );
  // }

  bool isScrolling() {
    controller.addListener(() {
      if (MediaQuery.of(context).size.height * 0.8 >
          controller.position.pixels) {
        if (isScrolled.value == true) {
          isScrolled.value = false;
        }
      } else {
        if (isScrolled.value == false) {
          isScrolled.value = true;
        }
      }
    });
    return isScrolled.value;
  }
}
