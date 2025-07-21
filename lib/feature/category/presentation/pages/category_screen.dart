import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/feature/category/presentation/blocs/categories/bloc/categories_bloc.dart';
import 'package:elaro_app/feature/category/presentation/widgets/category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              context.push(AppRouter.search);
            },
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                // filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "search".tr(),
                // fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, size: 24),
              ),
            ),
          ),
        ),
        body: SafeArea(child: CategoryBody()),
      ),
    );
  }
}
