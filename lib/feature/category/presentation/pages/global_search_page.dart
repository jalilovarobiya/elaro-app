import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/feature/category/presentation/blocs/search/bloc/search_bloc.dart';
import 'package:elaro_app/feature/category/presentation/widgets/global_search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalSearchPage extends StatelessWidget {
  const GlobalSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(body: SafeArea(child: GlobalSearchBody())),
    );
  }
}
