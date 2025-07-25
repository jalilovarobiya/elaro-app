import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/favourite_body.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleUz: "Istaklar",
        titleRu: "Избранное",
        titleCrl: "Истаклар",
      ),
      body: FavouriteBody(),
    );
  }
}
