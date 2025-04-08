part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
    String email,
    String password,
  ) = _Login;

  const factory AuthEvent.register(
    String email,
    String password,
  ) = _Register;

  const factory AuthEvent.googleSignin() = _GoogleSignin;
}
