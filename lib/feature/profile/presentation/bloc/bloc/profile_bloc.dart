import 'package:bloc/bloc.dart';
import 'package:elaro_app/core/failure/failure_model.dart';
import 'package:elaro_app/feature/profile/data/model/profile_model.dart';
import 'package:elaro_app/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepositoryImpl impl;

  ProfileBloc(this.impl) : super(const ProfileState.loading()) {
    on<_FetchData>(_fetchData);
    on<_EditProfile>(_editProfile);
  }
  _fetchData(_FetchData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final result = await impl.getProfile();
      result.fold(
        (left) => emit(ProfileState.failure(failure: left)),
        (right) => emit(ProfileState.success(profile: right)),
      );
    } catch (e) {
      emit(ProfileState.failure(failure: FailureModel(e.toString())));
    }
  }

  _editProfile(_EditProfile event, Emitter<ProfileState> emit) async {
    final request = await impl.profileEdit(
      name: event.name,
      surname: event.surname,
      address: event.address,
    );
    add(ProfileEvent.fetchData());
  }
}
