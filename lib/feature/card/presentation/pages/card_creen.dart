import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/feature/card/presentation/blocs/card/bloc/card_bloc.dart';
import 'package:elaro_app/feature/card/presentation/widgets/card_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      appBar: CustomAppBar(
        titleUz: "Savatcha",
        titleRu: "Корзина",
        titleCrl: "Саватча",
        navigate: false,
      ),
      body: RefreshIndicator.adaptive(
        child: CardBody(),
        onRefresh: () async {
          context.read<CardBloc>().add(CardEvent.fetchData());
        },
      ),
    );
  }
}
