import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/app_textfiled.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/button_widget.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart'
    hide Image;
import 'package:elaro_app/feature/order/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/profile_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OrderBody extends StatefulWidget {
  final List<Datum> data;
  const OrderBody({super.key, required this.data});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final ValueNotifier<int> payment = ValueNotifier(1);
  final ValueNotifier<int> delivary = ValueNotifier(1);
  final TextEditingController adres = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.h,
              Translator(
                uz: "Qabul qiluvchi",
                ru: "Получатель",
                crl: "Қабул қилувчи",
                style: AppStyle.w600s18h22DarkBluePrimary,
              ),
              16.h,
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.whenOrNull(
                        success: (profile) {
                          return ProfileInfoTile(
                            ontap: false,
                            name: profile.data?.name ?? "",
                            phone: "+998${profile.data?.phone ?? ""}",
                            last: profile.data?.surname ?? "",
                            address: profile.data?.address ?? "",
                          );
                        },
                      ) ??
                      SizedBox();
                },
              ),
              20.h,
              Translator(
                uz: "Mahsulotlar ${widget.data.length} dona",
                ru: "Товары ${widget.data.length} штук",
                crl: "Маҳсулотлар ${widget.data.length} дона",
                style: AppStyle.w600s18h22DarkBluePrimary,
              ),
              ...List.generate(
                widget.data.length,
                (generator) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 70,
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: widget.data[generator].images
                                      ?.firstOrNull?.image ??
                                  "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      12.w,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Translator(
                              uz: widget.data[generator].nameUz ?? "",
                              ru: widget.data[generator].nameRu ?? "",
                              crl: widget.data[generator].nameCrl ?? "",
                              style: AppStyle.w500s15h20Primary,
                              maxLen: 2,
                            ),
                            15.h,
                            Translator(
                              uz: "${Utils.cashFormat("${widget.data[generator].price ?? 0}")} ${"sum".tr()}",
                              ru: "${Utils.cashFormat("${widget.data[generator].price ?? 0}")} ${"sum".tr()}",
                              crl:
                                  "${Utils.cashFormat("${widget.data[generator].price ?? 0}")} ${"sum".tr()}",
                              style: AppStyle.w500s15h20Primary,
                              maxLen: 4,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Translator(
                        uz: "${widget.data[generator].quantity} dona",
                        ru: "${widget.data[generator].quantity} штук",
                        crl: "${widget.data[generator].quantity} дона",
                      ),
                    ],
                  ),
                ),
              ),
              20.h,
              ValueListenableBuilder(
                valueListenable: delivary,
                builder: (context, value, _) {
                  return Container(
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    decoration: AppStyle.lightGray100R14B1White,
                    child: Row(
                      children: [
                        Expanded(
                          child: ZoomTapAnimation(
                            onTap: () {
                              delivary.value = 1;
                            },
                            child: DecoratedBox(
                              decoration: value == 1
                                  ? AppStyle.white16r
                                  : const BoxDecoration(),
                              child: Center(
                                  child: Text("delivery".tr(),
                                      style: AppStyle.w500s15h20Primary)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ZoomTapAnimation(
                            onTap: () {
                              delivary.value = 2;
                              adres.text = getLanguage(true) == "uz"
                                  ? "Qashqadaryo viloyati, Qarshi shahri, Nasaf ko‘chasi, 180100"
                                  : (getLanguage(true) == "ru"
                                      ? "Кашкадарьинская область, Карши, улица Насаф, 180100"
                                      : "Қашқадарё вилояти, Қарши шаҳри, Насаф кўчаси, 180100");
                            },
                            child: DecoratedBox(
                                decoration: value == 2
                                    ? AppStyle.white16r
                                    : const BoxDecoration(),
                                child: Center(
                                    child: Text("take_away".tr(),
                                        style: AppStyle.w500s15h20Primary))),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.h,
              ValueListenableBuilder(
                  valueListenable: delivary,
                  builder: (context, value, _) {
                    if (value == 1) {
                      return ZoomTapAnimation(
                          onTap: () async {
                            final location =
                                await context.push(AppRouter.region);
                            if (location == null) return;
                            adres.text = location.toString();
                          },
                          child: AppTextfiled(
                            enable: false,
                            controller: adres,
                            maxLines: 4,
                            minLines: 1,
                            validator: (text) =>
                                Utils.validator(text, 3, "required_filed".tr()),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColor.lightGray400),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColor.lightGray400),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppColor.lightGray400),
                              ),
                              fillColor: AppColor.white,
                              hintText: "address".tr(),
                              prefixIcon:
                                  const Icon(Icons.home, color: AppColor.black),
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            hintText: "address".tr(),
                          ));
                    } else {
                      return ListTile(
                        onTap: () async {
                          final uri = Uri.parse(
                            Utils.generateGoogleMapsLink(38.8361833, 65.782186),
                          );
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw "coudnot launch $uri";
                          }
                        },
                        leading: Icon(
                          Icons.location_on_outlined,
                          color: AppColor.primary,
                        ),
                        title: Translator(
                          uz: "Qashqadaryo viloyati, Qarshi shahri, Nasaf ko'chasi, 180100",
                          ru: "Кашкадарьинская область, Карши, улица Насаф, 180100",
                          crl:
                              "Қашқадарё вилояти, Қарши шаҳри, Насаф кўчаси, 180100",
                          maxLen: 3,
                        ),
                        subtitle: Text("9:00-21:00"),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      );
                    }
                  }),
              20.h,
              Translator(
                uz: "To'lov usuli",
                ru: "Способ оплаты",
                crl: "Тўлов усули",
                style: AppStyle.w600s18h22DarkBluePrimary,
              ),
              20.h,
              ValueListenableBuilder(
                valueListenable: payment,
                builder: (context, value, _) {
                  return Container(
                    decoration: AppStyle.white16r
                        .copyWith(border: Border.all(width: 0.5)),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            payment.value = 1;
                          },
                          child: ListTile(
                            title: Text("naxt".tr(),
                                style: AppStyle.w500s15h20DarkBlue500),
                            leading: Image.asset(
                              AppImages.money,
                              width: 50,
                            ),
                            trailing: Icon(
                              payment.value == 1
                                  ? Icons.check_circle
                                  : Icons.circle,
                              color: payment.value == 1
                                  ? AppColor.primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Divider(thickness: 0.5, height: 1),
                        GestureDetector(
                          onTap: () {
                            payment.value = 2;
                          },
                          child: ListTile(
                            title: Text("Click",
                                style: AppStyle.w500s15h20DarkBlue500),
                            leading: Image.asset(
                              AppImages.click,
                              width: 50,
                            ),
                            trailing: Icon(
                              payment.value == 2
                                  ? Icons.check_circle
                                  : Icons.circle,
                              color: payment.value == 2
                                  ? AppColor.primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Divider(thickness: 0.5, height: 1),
                        GestureDetector(
                          onTap: () {
                            payment.value = 3;
                          },
                          child: ListTile(
                            title: Text("Payme",
                                style: AppStyle.w500s15h20DarkBlue500),
                            leading: Image.asset(
                              AppImages.payme,
                              width: 50,
                            ),
                            trailing: Icon(
                              payment.value == 3
                                  ? Icons.check_circle
                                  : Icons.circle,
                              color: payment.value == 3
                                  ? AppColor.primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.h,
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return ButtonWidget(
                    text: "checkout".tr(),
                    onTap: () {
                      context.read<OrderBloc>().add(
                            OrderEvent.order(
                              adres: adres.text,
                              id: payment.value.toString(),
                              delivaryId: delivary.value.toString(),
                            ),
                          );
                    },
                  );
                },
              ),
              30.h,
            ],
          ),
        ),
      ),
    );
  }

  String getLanguage(bool isShort) {
    final language = context.locale.languageCode;
    if (isShort) {
      return language;
    } else {
      if (language == "uz") {
        return "O'zbekcha";
      } else if (language == "en") {
        return "Ўзбекча";
      } else {
        return "Русский";
      }
    }
  }
}
