import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elaro_app/feature/card/data/model/card_model.dart';
import 'package:elaro_app/feature/card/data/repository/card_repository_impl.dart';
import 'package:elaro_app/feature/home/data/model/products_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_event.dart';
part 'card_state.dart';
part 'card_bloc.freezed.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepositoryImpl impl;

  CardBloc(this.impl) : super(CardState.loading()) {
    on<_FetchData>(_fetchCart);
    on<_AddProduct>(_addProduct);
    on<_UpdateQuantity>(_updateQuantity);
    on<_RemoveProduct>(_removeProduct);
    on<_ClearCart>(_clearCart);
  }

  Future<void> _fetchCart(_FetchData event, Emitter<CardState> emit) async {
    try {
      // log('CardBloc: Fetching cart data...');
      // emit(const CardState.loading());

      // final cartItems = await impl.getCartItems();
      // log('CardBloc: Fetched ${cartItems.length} cart items');

      // emit(CardState.success(data: cartItems));
      var result = await impl.getCartItems();
      emit(CardState.success(data: result, qty: 1));
    } catch (e) {
      log('CardBloc: Error fetching cart: $e');
      emit(const CardState.failure());
    }
  }

  Future<void> _addProduct(_AddProduct event, Emitter<CardState> emit) async {
    final result = await impl.addProduct(
      CardModel(
        titleUz: event.product.nameUz ?? "",
        titleRu: event.product.nameRu ?? "",
        titleCrl: event.product.nameCrl ?? "",
        price: event.product.price ?? "",
        productId: event.product.id.toString(),
        image: event.product.images?.firstOrNull?.image ?? "",
        productCount: 1,
        qty: event.product.qty ?? 0,
        discountStart: event.product.discountStart,
        discount: event.product.discount,
        discountedPrice: event.product.discountedPrice,
        discountType: event.product.discountType,
        discountEnd: event.product.discountEnd,
        quantity: 1,
      ),
    );
    add(const CardEvent.fetchData());
  }

  Future<void> _updateQuantity(
    _UpdateQuantity event,
    Emitter<CardState> emit,
  ) async {
    final result = await impl.updateQuantity(event.id, event.count);
    add(const CardEvent.fetchData());

    // try {
    //   final success = await impl.updateQuantity(event.id, event.count);
    //   if (success) {
    //     add(const CardEvent.fetchData());
    //   } else {
    //     emit(const CardState.failure());
    //   }
    // } catch (e) {
    //   emit(const CardState.failure());
    // }
  }

  Future<void> _removeProduct(
    _RemoveProduct event,
    Emitter<CardState> emit,
  ) async {
    final result = await impl.removeFromCard(event.id);
    add(const CardEvent.fetchData());
    // try {
    //   final success = await impl.removeFromCard(event.id);
    //   if (success) {
    //     add(const CardEvent.fetchData());
    //   } else {
    //     emit(const CardState.failure());
    //   }
    // } catch (e) {
    //   emit(const CardState.failure());
    // }
  }

  Future<void> _clearCart(_ClearCart event, Emitter<CardState> emit) async {
    final result = await impl.decrement(event.id, event.quantity);
    add(const CardEvent.fetchData());
    // try {
    //   final success = await impl.decrement(event.id, event.quantity);
    //   if (success) {
    //     add(const CardEvent.fetchData());
    //   } else {
    //     emit(const CardState.failure());
    //   }
    // } catch (e) {
    //   emit(const CardState.failure());
    // }
  }
}
