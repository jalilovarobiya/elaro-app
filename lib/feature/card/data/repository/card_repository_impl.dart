import 'dart:developer';

import 'package:elaro_app/core/interceptor/interceptor.dart';
import 'package:elaro_app/core/utils/utils.dart';
import 'package:elaro_app/feature/card/data/model/card_model.dart';
import 'package:elaro_app/feature/card/domain/repository/card_repositoyr.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';

class CardRepositoryImpl implements CardRepositoyr {
  final DioClient client;

  CardRepositoryImpl(this.client);

  @override
  Future<bool> addProduct(CardModel card) async {
    final user = await Utils.getUser();
    final request = await client.post(
      url: "/add-cart",
      body: {
        "cart_id": user.data?.id,
        "product_id": card.productId,
        "quantity": card.qty,
      },
    );
    print("user id: ${user.data?.id}");
    print("product id: ${card.productId}");
    print("miqdori ${card.qty}");

    return request.isSuccess;
  }

  @override
  Future<bool> updateQuantity(String id, int quantity) async {
    try {
      if (quantity <= 0) {
        return await removeFromCard(id);
      }

      final request = await client.post(
        url: "/add-cart",
        body: {"product_id": id, "quantity": quantity},
      );

      return request.isSuccess;

      // return removeResult.fold((left) => Left(left), (right) async {
      //   if (right) {

      //   }
      //   return Left(FailureModel("Mahsulot sonini o'zgartirishda xatolik"));
      // });
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> removeFromCard(String id) async {
    try {
      final request = await client.delete(url: "/remove-product/$id");
      return request.isSuccess;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> decrement(String id, int quantity) async {
    try {
      if (quantity <= 0) {
        return await removeFromCard(id);
      }

      final request = await client.post(
        url: "/add-cart",
        body: {"product_id": id, "quantity": quantity},
      );

      return request.isSuccess;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Datum>> getCartItems() async {
    try {
      log('Repository: Fetching cart items...');

      final request = await client.get(url: "/cart");

      if (request.isSuccess) {
        // final List<dynamic> data = request.response['data'] ?? [];
        // final cartItems = data.map((item) => CardModel.fromJson(item)).toList();
        // log('Repository: Successfully fetched ${cartItems.length} cart items');
        return List<Datum>.from(
          request.response["data"][0]["products"].map((e) => Datum.fromJson(e)),
        );
      } else {
        log('Repository: Failed to fetch cart items: ${request.response}');
        return [];
      }
    } catch (e) {
      log('Repository: Error fetching cart items: $e');
      return [];
    }
  }
}
