import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/category/data/model/search_model.dart';
import 'package:elaro_app/feature/category/data/repository/search_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepositoryImpl impl;

  SearchBloc(this.impl) : super(SearchState.initial()) {
    on<_Search>(_search);
  }

  _search(_Search event, Emitter<SearchState> emit) async {
    emit(SearchState.loading());
    final request = await impl.search(event.text);
    try {
      request.fold(
        (left) => emit(SearchState.failure(data: left)),
        (right) => emit(SearchState.success(data: right)),
      );
    } catch (e) {
      emit(SearchState.failure(data: FailureModel(e.toString())));
    }
  }
}
