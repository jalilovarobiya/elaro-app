import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/category/data/model/sub_category_constructr_model.dart';
import 'package:elaro_app/feature/category/presentation/blocs/sub_category/bloc/sub_category_bloc.dart';
import 'package:elaro_app/feature/category/presentation/widgets/sub_category_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryPage extends StatelessWidget {
  final SubCategoryConstructorModel data;

  const SubCategoryPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<SubCategoryBloc>()
                ..add(SubCategoryEvent.fetchData(id: data.id)),
      child: Scaffold(
        appBar: CustomAppBar(
          titleUz: data.titleUz,
          titleRu: data.titleRu,
          titleCrl: data.titleCrl,
        ),
        body: SubCategoryPageBody(),
      ),
    );
  }
}
