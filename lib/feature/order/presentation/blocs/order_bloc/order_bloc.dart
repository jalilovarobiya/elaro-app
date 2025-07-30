import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/card/data/repository/card_repository_impl.dart';
import 'package:elaro_app/feature/order/data/model/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CardRepositoryImpl impl;

  OrderBloc(this.impl) : super(OrderState.initial()) {
    on<_Order>(_order);
  }
  _order(_Order event, Emitter<OrderState> emit) async {
    try {
      emit(OrderState.loading());
      final request = await impl.saveOrder(
        adres: event.adres,
        paymentType: event.id,
        id: event.delivaryId,
      );
      emit(OrderState.success(data: request));
    } catch (e) {
      emit(
        OrderState.failure(
          failure: FailureModel(
            json.decode(e.toString())["message"].toString(),
          ),
        ),
      );
    }
  }
}
