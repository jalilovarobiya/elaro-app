import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: CustomAppBar(
        titleUz: "Buyurtmalar",
        titleRu: "Заказ",
        titleCrl: "Буюртмалар",
        navigate: false,
      ),
      body: Padding(padding: const EdgeInsets.all(16)),
    );
  }
}
