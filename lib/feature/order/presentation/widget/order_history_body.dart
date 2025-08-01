import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/extension/order_extension.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/core/widgets/empty_widget.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/loading_widget.dart';
import 'package:elaro_app/feature/order/presentation/blocs/order_history_bloc/order_history_bloc.dart';
import 'package:elaro_app/feature/order/presentation/pages/order_history_ditails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OrderHistoryBody extends StatefulWidget {
  const OrderHistoryBody({super.key});

  @override
  State<OrderHistoryBody> createState() => _OrderHistoryBodyState();
}

class _OrderHistoryBodyState extends State<OrderHistoryBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => LoadingWidget(),
            success: (success) {
              return RefreshIndicator.adaptive(
                onRefresh: () async {
                  context.read<OrderHistoryBloc>().add(
                    OrderHistoryEvent.started(),
                  );
                  Future.delayed(Duration(microseconds: 500));
                },
                child:
                    success.data?.length == 0
                        ? EmptyWidget()
                        : ListView.builder(
                          itemCount: success.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = success.data![index];
                            return ZoomTapAnimation(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (builder) => OrderHistoryDitailsScreen(
                                          data: data,
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: AppColor.lightGray500,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ID: ${data.id}",
                                      style: AppStyle.w400s13h18DarkBlue300,
                                    ),
                                    12.h,
                                    Text(
                                      DateFormat('yyyy-MM-dd HH:mm').format(
                                        DateTime.parse(
                                          data.orderDateTime ?? "",
                                        ).add(const Duration(hours: 5)),
                                      ),
                                      style: AppStyle.w400s13h18DarkBlue300,
                                    ),

                                    6.h,
                                    Divider(thickness: 0.4, height: 1),
                                    6.h,
                                    Wrap(
                                      spacing: 12,
                                      children: List.generate(
                                        data.products?.length ?? 0,
                                        (generator) => Container(
                                          height: 80,
                                          width: 80,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                          decoration:
                                              AppStyle.lightGray400R16NoBorder,
                                          child: Image.network(
                                            data
                                                    .products?[generator]
                                                    .images
                                                    ?.firstOrNull
                                                    ?.image ??
                                                "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    6.h,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Translator(
                                          uz: "Buyurtma miqdori",
                                          ru: "Количество заказов",
                                          crl: "Буюртма миқдори",
                                          style: AppStyle.w400s15h20DarkBlue700,
                                        ),
                                        Translator(
                                          uz:
                                              "${Utils.cashFormat("${data.totalAmount ?? 0}")} ${"sum".tr()}",
                                          ru:
                                              "${Utils.cashFormat("${data.totalAmount ?? 0}")} ${"sum".tr()}",
                                          crl:
                                              "${Utils.cashFormat("${data.totalAmount ?? 0}")} ${"sum".tr()}",
                                          style:
                                              AppStyle
                                                  .w700s18h28DarkBluePrimary,
                                          maxLen: 4,
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                    6.h,
                                    Container(
                                      decoration: AppStyle.cyan75.copyWith(
                                        color:
                                            (data.status ?? 0)
                                                .getOrderHistoryStatusColor,
                                      ),

                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),

                                      child:
                                          (data.status ?? 0)
                                              .getOrderHistoryStatusWhite,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
              );
            },
            error: () => EmptyWidget(),
          );
        },
      ),
    );
  }
}
