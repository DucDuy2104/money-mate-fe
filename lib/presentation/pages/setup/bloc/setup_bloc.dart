import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'setup_event.dart';
part 'setup_state.dart';
part 'setup_bloc.freezed.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  SetupBloc() : super(const SetupState.initial()) {
    on<_Setup>(_onSetup);
  }

  void _onSetup(_Setup event, Emitter<SetupState> emit) async {
    try {
      emit(const SetupState.loading());
      await Future.delayed(const Duration(seconds: 2));
      final result = await _usersRepository.update({
        'name': event.name,
        'budget': event.budget,
      });
      result.fold(
        (failure) {
          emit(SetupState.error(failure.message));
          return;
        },
        (user) {
          emit(SetupState.success(user));
          return;
        },
      );
    } catch (e) {
      emit(const SetupState.error('Lỗi cập nhật tài khoảng'));
      debugPrint(e.toString());
    }
  }
}
