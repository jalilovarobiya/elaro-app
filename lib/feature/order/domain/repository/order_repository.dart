import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/order/data/model/order_history_model.dart';

abstract class OrderRepository {
  Future<Either<FailureModel, OrderHistoryModel>> fetchData();
}
