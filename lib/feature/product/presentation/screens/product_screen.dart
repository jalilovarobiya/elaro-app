import 'package:clean_arxitekture/feature/home/data/model/products_model.dart';
import 'package:clean_arxitekture/feature/product/presentation/views/product_body.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel data;
  const ProductScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductBody(data: data));
  }
}
