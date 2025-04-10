import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'password_event.dart';
part 'password_state.dart';
part 'password_bloc.freezed.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  PasswordBloc() : super(const PasswordState.initial()) {
    on<_UpdatePass>(_onUpdatePass);
  }

  void _onUpdatePass(_UpdatePass event, Emitter<PasswordState> emit) async {
    emit(const PasswordState.loading());
    try {
      final updatePassResult =
          await _usersRepository.updatePass(event.oldPass, event.password);
      updatePassResult.fold((failure) {
        emit(PasswordState.error(failure.message));
      }, (user) {
        emit(PasswordState.success(user));
      });
    } catch (e) {
      log('Update pass error $e');
      emit(const PasswordState.error('Có lỗi xảy ra!'));
    }
  }
}
