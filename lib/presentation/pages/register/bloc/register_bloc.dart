import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepositoryImpl = getIt<AuthRepository>();
  RegisterBloc() : super(const RegisterState.initial()) {
    on<_Register>(_register);
  }

  void _register(_Register event, Emitter<RegisterState> emit) async {
    try {
      emit(const RegisterState.loading());
      await Future.delayed(const Duration(seconds: 2));
      final result =
          await _authRepositoryImpl.register(event.email, event.password);
      result.fold((failure) {
        emit(RegisterState.failure(failure.message));
        return;
      }, (user) {
        emit(RegisterState.success(user));
        return;
      });
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
      return;
    }
  }
}
