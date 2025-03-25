part of 'setup_bloc.dart';

@freezed
class SetupState with _$SetupState {
  const factory SetupState.initial() = _Initial;
  const factory SetupState.loading() = _Loading;
  const factory SetupState.success(User user) = _Success;
  const factory SetupState.error(String message) = _Error;
}
