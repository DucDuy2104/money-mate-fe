part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState.initial() = _Initial;
  const factory PasswordState.loading() = _Loading;
  const factory PasswordState.success(User user) = _Success;
  const factory PasswordState.error(String err) = _Error;
}
