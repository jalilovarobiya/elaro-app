import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LotteiWidget extends StatelessWidget {
  const LotteiWidget({
    super.key,
    required this.image,
    this.height,
    this.weight,
  });
  final String image;
  final double? height;
  final double? weight;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(image, height: height, width: weight);
  }
}
