import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          CupertinoIcons.shopping_cart,
          size: 100,
          color: Colors.black,
        ),

        const SizedBox(height: 10),
        Text("empty_card".tr(), textAlign: TextAlign.center),
      ],
    );
  }
}
