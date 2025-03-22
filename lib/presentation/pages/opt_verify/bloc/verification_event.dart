part of 'verification_bloc.dart';

@freezed
class VerificationEvent with _$VerificationEvent {
  const factory VerificationEvent.sendCode(String id) = _SendCode;
  const factory VerificationEvent.verify(String id, String code) = _Verify;
}