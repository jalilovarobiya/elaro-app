import 'package:elaro_app/feature/card/data/model/card_model.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';
import 'package:elaro_app/feature/order/data/model/order_model.dart';

abstract class CardRepositoyr {
  Future<List<Datum>> getCartItems();
  Future<bool> addProduct(CardModel card);
  Future<bool> removeFromCard(String id);
  Future<bool> updateQuantity(String id, int quantity);
  Future<bool> decrement(String id, int quantity);
  Future<OrderModel> saveOrder({
    required String adres,
    required String paymentType,
    required String id,
  });
}
