import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';

part 'verification_event.dart';
part 'verification_state.dart';
part 'verification_bloc.freezed.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  VerificationBloc() : super(const VerificationState.initial()) {
    on<_SendCode>(_onSendVerification);
    on<_Verify>(_onVerifyCode);
  }

  void _onSendVerification(
      _SendCode event, Emitter<VerificationState> emit) async {
    try {
      emit(const VerificationState.sendingCode());

      final result = await _authRepository.sendVerificationCode(event.id);
      result.fold((failure) {
        emit(VerificationState.error(failure.message));
        return;
      }, (isSuccess) {
        emit(VerificationState.codeSent(isSuccess));
        return;
      });
    } catch (e) {
      emit(VerificationState.error(e.toString()));
      return;
    }
  }

  void _onVerifyCode(_Verify event, Emitter<VerificationState> emit) async {
    try {
      emit(const VerificationState.verifying());
      final result = await _authRepository.verification(event.id, event.code);
      result.fold((failure) {
        emit(VerificationState.error(failure.message));
        return;
      }, (user) {
        emit(const VerificationState.verified());
        return;
      });
    } catch (e) {
      emit(VerificationState.error(e.toString()));
      return;
    }
  }
}
