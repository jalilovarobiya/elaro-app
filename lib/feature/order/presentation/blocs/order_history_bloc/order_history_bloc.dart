import 'package:bloc/bloc.dart';
import 'package:elaro_app/feature/order/data/model/order_history_model.dart';
import 'package:elaro_app/feature/order/data/repository/order_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';
part 'order_history_bloc.freezed.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderRepositoryImpl impl;

  OrderHistoryBloc(this.impl) : super(OrderHistoryState.initial()) {
    on<_Started>(_started);
  }

  _started(_Started event, Emitter<OrderHistoryState> emit) async {
    emit(OrderHistoryState.loading());
    try {
      final request = await impl.fetchData();
      request.fold(
        (left) => emit(OrderHistoryState.error()),
        (right) => emit(OrderHistoryState.success(data: right)),
      );
    } catch (e) {
      emit(OrderHistoryState.error());
    }
  }
}
