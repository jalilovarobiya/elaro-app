import 'package:elaro_app/core/widgets/search_view_delegate.dart';
import 'package:elaro_app/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_package_for_height/my_package.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(
                productsBloc: context.read<ProductsBloc>(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Icon(Icons.search), 10.width, Text("Search")],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
