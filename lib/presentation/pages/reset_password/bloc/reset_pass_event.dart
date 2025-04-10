part of 'reset_pass_bloc.dart';

@freezed
class ResetPassEvent with _$ResetPassEvent {
  const factory ResetPassEvent.started() = _Started;
  const factory ResetPassEvent.resetPassword(String id, String password) = _ResetPassword;
}