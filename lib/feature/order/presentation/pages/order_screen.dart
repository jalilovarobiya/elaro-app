import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

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
