import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
import 'package:money_mate/domain/entities/login_data.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final OnboardLocalDataSource _localDataSource =
      getIt<OnboardLocalDataSource>();
  LoginBloc() : super(const LoginState.initial()) {
    on<_Login>(_onLogin);
  }

  void _onLogin(_Login event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginState.loading());
      await Future.delayed(const Duration(seconds: 2));
      final result = await _authRepository.login(event.email, event.password);
      result.fold((failure) {
        emit(LoginState.error(failure.message));
        return;
      }, (loginData) {
        if (loginData.user.isActive) {
          _localDataSource.saveAccessToken(loginData.accessToken);
          _localDataSource.saveRefreshToken(loginData.refreshToken);
        }
        emit(LoginState.success(loginData));
        return;
      });
    } catch (e) {
      emit(LoginState.error(e.toString()));
      return;
    }
  }
}
