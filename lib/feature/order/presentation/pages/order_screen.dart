import 'package:clean_arxitekture/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:my_package_for_height/my_package.dart';

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
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            15.height,
            CustomButton(
              text: ("Kirish"),
              onPressed: () {},
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
