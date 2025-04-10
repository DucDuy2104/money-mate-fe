part of 'password_bloc.dart';

@freezed
class PasswordEvent with _$PasswordEvent {
  const factory PasswordEvent.updatePass(String oldPass, String password) = _UpdatePass;
}