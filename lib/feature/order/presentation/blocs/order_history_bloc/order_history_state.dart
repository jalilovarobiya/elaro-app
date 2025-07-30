part of 'order_history_bloc.dart';

@freezed
class OrderHistoryState with _$OrderHistoryState {
  const factory OrderHistoryState.initial() = _Initial;
  const factory OrderHistoryState.loading() = _Loading;
  const factory OrderHistoryState.success({required OrderHistoryModel data}) =
      _Success;
  const factory OrderHistoryState.error() = _Error;
}
