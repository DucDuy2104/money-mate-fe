part of 'email_next_bloc.dart';

@freezed
class EmailNextState with _$EmailNextState {
  const factory EmailNextState.initial() = _Initial;
  const factory EmailNextState.loading() = _Loading;
  const factory EmailNextState.success(User user) = _Success;
  const factory EmailNextState.error(String error) = _Error;
}
