part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded(ProfileData data) = _Loaded;
  const factory ProfileState.error(String error) = _Error;
  const factory ProfileState.updating(ProfileData data) = _Updating;
}

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData(
      {required List<Category> categories,
      required User profile}) = _ProfileData;
}
