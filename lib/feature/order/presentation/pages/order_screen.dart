import 'package:clean_arxitekture/core/constants/app_colors.dart';
import 'package:clean_arxitekture/core/widgets/custom_button.dart';
import 'package:clean_arxitekture/main.dart';
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
      appBar: AppBar(title: Text("Xush kelibsiz!")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixText: "+998",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary),
                ),
              ),
            ),
            15.height,
            CustomButton(
              text: ("Kirish"),
              onPressed: () {},
              color: AppColor.primary,
            ),
          ],
        ),
      ),
    );
  }
}
