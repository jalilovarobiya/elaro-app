import 'package:dartz/dartz.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/core/interceptor/interceptor.dart';
import 'package:elaro_app/feature/order/data/model/order_history_model.dart';
import 'package:elaro_app/feature/order/domain/repository/order_repository.dart';
import 'package:get/get_utils/get_utils.dart';

class OrderRepositoryImpl implements OrderRepository {
  final DioClient client;

  OrderRepositoryImpl(this.client);
  @override
  Future<Either<FailureModel, OrderHistoryModel>> fetchData() async {
    final requset = await client.get(url: "/order-history");
    if (requset.isSuccess) {
      return Right(OrderHistoryModel.fromJson(requset.response));
    }
    return Left(FailureModel(requset.response["message"] ?? "empty_card".tr));
  }
}
