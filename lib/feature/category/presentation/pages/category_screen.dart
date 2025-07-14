import 'package:clean_arxitekture/feature/category/presentation/widgets/category_body.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: CategoryBody()));
  }
}
