import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/category/data/model/category_constructr.dart';
import 'package:elaro_app/feature/category/presentation/blocs/category/bloc/category_bloc.dart';
import 'package:elaro_app/feature/category/presentation/widgets/categor_bady.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.data});
  final CategoryConstructorModel data;
  final bloc = sl<CategoryBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: CustomAppBar(
          titleUz: data.titleUz,
          titleRu: data.titleRu,
          titleCrl: data.titleCrl,
        ),
        body: CategorBady(id: data.id, bloc: bloc),
      ),
    );
  }
}
