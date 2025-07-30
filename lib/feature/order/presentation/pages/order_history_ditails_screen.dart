import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/order/data/model/order_history_model.dart';
import 'package:elaro_app/feature/order/presentation/widget/order_history_details_body.dart';
import 'package:flutter/material.dart';

class OrderHistoryDitailsScreen extends StatelessWidget {
  final Datum data;
  const OrderHistoryDitailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleUz: "Buyurtma haqida",
        titleRu: "О заказе",
        titleCrl: "Буюртма ҳақида",
      ),
      body: OrderHistoryDetailsBody(data: data),
    );
  }
}
