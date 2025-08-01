import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/source/main_source.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/feature/card/presentation/blocs/card/bloc/card_bloc.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:elaro_app/feature/order/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:elaro_app/feature/order/presentation/widget/order_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderScreen extends StatefulWidget {
  final List<Datum> cards;

  const OrderScreen({super.key, required this.cards});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderBloc>(),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.whenOrNull(
            failure:
                (failure) => CustomToast.showToast(
                  context,
                  AppImages.error,
                  failure.error,
                  Colors.white,
                  Colors.red,
                ),
            success: (data) {
              context.read<CardBloc>()..add(CardEvent.fetchData());
              context.pop();
              MainSources.currentPage.value == 3;
              if (data.paymentUrl != null) launch(data.paymentUrl ?? "");
            },
          );
        },
        child: Scaffold(
          appBar: CustomAppBar(
            titleUz: "Buyurtmalar",
            titleRu: "Заказ",
            titleCrl: "Буюртмалар",
            navigate: true,
          ),
          body: OrderBody(data: widget.cards),
        ),
      ),
    );
  }
}
