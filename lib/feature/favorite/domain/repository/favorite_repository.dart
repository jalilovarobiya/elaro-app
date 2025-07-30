import '../../../card/data/model/card_model.dart';

abstract class FavoriteRepository {
  Future<void> addToCard(CardModel data);
  Future<List<CardModel>> getCards();
  Future<void> deleteCard(String id);
}