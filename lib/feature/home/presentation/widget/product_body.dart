import 'package:flutter/material.dart';
import 'package:elaro_app/feature/home/data/model/product_model.dart' as model;

class ProductBody extends StatelessWidget {
  final model.ProductModel product;

  const ProductBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      // children: [
      //   if (data.images != null && data.images!.isNotEmpty)
      //     Image.network(
      //       data.images!.first.image ?? '',
      //       height: 250,
      //       fit: BoxFit.cover,
      //       errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
      //     ),
      //   const SizedBox(height: 16),
      //   Text(
      //     data.color ?? '',
      //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      //   const SizedBox(height: 8),
      //   Text(
      //     '${data.price ?? '0'} so\'m',
      //     style: const TextStyle(fontSize: 18, color: Colors.green),
      //   ),
      //   const SizedBox(height: 16),
      //   DescriptionBody(textUz: "Bu mahsulot haqida ma'lumot yo'q."),
      //   const SizedBox(height: 20),
      //   ElevatedButton(
      //     onPressed: () {
      //       // TODO: Savatga qo‘shish funksiyasi
      //     },
      //     child: const Text("Savatga qo‘shish"),
      //   ),
      // ],
    );
  }
}
