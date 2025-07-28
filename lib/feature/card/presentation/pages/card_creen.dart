import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/card/presentation/widgets/card_body.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleUz: "Savatcha",
        titleRu: "Корзина",
        titleCrl: "Саватча",
        navigate: false,
      ),
      body: RefreshIndicator(child: CardBody(), onRefresh: () async {}),
    );
  }
}
