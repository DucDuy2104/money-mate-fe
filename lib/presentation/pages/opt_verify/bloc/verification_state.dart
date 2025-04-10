part of 'verification_bloc.dart';

@freezed
class VerificationState with _$VerificationState {
  const factory VerificationState.initial() = _Initial;
  const factory VerificationState.sendingCode() = _SendingCode;
  const factory VerificationState.codeSent(bool isSuccess) = _CodeSent;
  const factory VerificationState.verifying() = _Verifying;
  const factory VerificationState.verified(User user) = _Verified;
  const factory VerificationState.error(String message) = _Error;
}
