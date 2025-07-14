import 'package:clean_arxitekture/core/utils/di.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/brends/bloc/brends_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/categories/bloc/categories_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/hit_products/bloc/hit_products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/new_products/bloc/new_products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/blocs/products/bloc/products_bloc.dart';
import 'package:clean_arxitekture/feature/home/presentation/widget/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsEvent.fetchData());
    context.read<NewProductsBloc>().add(NewProductsEvent.fetchData());
    context.read<HitProductsBloc>().add(HitProductsEvent.fetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  sl<CategoriesBloc>()..add(CategoriesEvent.fetchData()),
        ),
        BlocProvider(
          create: (context) => sl<BrendsBloc>()..add(BrendsEvent.fetchData()),
        ),
      ],
      child: Scaffold(body: HomeBody()),
    );
  }
}
