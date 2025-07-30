part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.order({
    required String adres,
    required String id,
    required String delivaryId,
  }) = _Order;
}
