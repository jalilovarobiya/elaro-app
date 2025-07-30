import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "total_amount") int? totalAmount,
    @JsonKey(name: "payment_url") String? paymentUrl,
    @JsonKey(name: "payment_type") String? paymentType,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
