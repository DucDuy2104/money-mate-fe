import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'email_next_event.dart';
part 'email_next_state.dart';
part 'email_next_bloc.freezed.dart';

class EmailNextBloc extends Bloc<EmailNextEvent, EmailNextState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  EmailNextBloc() : super(const EmailNextState.initial()) {
    on<_Next>(_onNext);
  }

  void _onNext(_Next event, Emitter<EmailNextState> emit) async {
    emit(const EmailNextState.loading());
    try {
      final userResult = await _usersRepository.getUserViaEmail(event.email);
      userResult.fold((failure) {
        emit(EmailNextState.error(failure.message));
      }, (user) {
        emit(EmailNextState.success(user));
      });
    } catch (e) {
      log(e.toString());
      emit(const EmailNextState.error('Có lỗi xảy ra'));
    }
  }
}
