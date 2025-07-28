part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
  const factory CardState.loading() = _Loading;
  const factory CardState.success({
    required List<Datum> data,
    required int? qty,
  }) = _Success;
  const factory CardState.failure() = _Failure;
}
