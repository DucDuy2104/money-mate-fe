import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'reset_pass_event.dart';
part 'reset_pass_state.dart';
part 'reset_pass_bloc.freezed.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  ResetPassBloc() : super(const ResetPassState.initial()) {
    on<_ResetPassword>(_onResetPassword);
  }

  void _onResetPassword(
      _ResetPassword event, Emitter<ResetPassState> emit) async {
    emit(const ResetPassState.loading());
    try {
      final resetResult =
          await _usersRepository.resetPassword(event.id, event.password);
      resetResult.fold((failure) {
        emit(ResetPassState.error(failure.message));
      }, (user) {
        emit(ResetPassState.success(user));
      });
    } catch (e) {
      emit(const ResetPassState.error('Có lỗi xảy ra'));
      log(e.toString());
    }
  }
}
