import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: AppColor.white,
      ),
      onPressed: onTap,
      icon: Icon(
        isSelected ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
        color: isSelected ? AppColor.red : AppColor.lightGray700,
      ),
    );
  }
}
