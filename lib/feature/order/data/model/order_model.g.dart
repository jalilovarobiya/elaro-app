// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      message: json['message'] as String?,
      orderId: (json['order_id'] as num?)?.toInt(),
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      paymentUrl: json['payment_url'] as String?,
      paymentType: json['payment_type'] as String?,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order_id': instance.orderId,
      'total_amount': instance.totalAmount,
      'payment_url': instance.paymentUrl,
      'payment_type': instance.paymentType,
    };
