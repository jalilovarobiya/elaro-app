import 'package:elaro_app/core/utils/di.dart';
import 'package:elaro_app/feature/order/presentation/blocs/order_history_bloc/order_history_bloc.dart';
import 'package:elaro_app/feature/order/presentation/widget/order_history_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => sl<OrderHistoryBloc>()..add(OrderHistoryEvent.started()),
      child: Scaffold(body: OrderHistoryBody()),
    );
  }
}
