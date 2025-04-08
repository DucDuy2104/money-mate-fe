import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/auth_service/google_auth_service.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final OnboardLocalDataSource _onboardLocalDataSource =
      getIt<OnboardLocalDataSource>();
  AuthBloc() : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
    on<_Register>(_onRegister);
    on<_GoogleSignin>(_onGoogleSignin);
  }
  void _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final loginResult =
          await _authRepository.login(event.email, event.password);
      loginResult.fold((failure) {
        emit(
          AuthState.error(failure.message),
        );
      }, (loginData) async {
        if (loginData.user.isActive) {
          _onboardLocalDataSource.saveAccessToken(loginData.accessToken);
          _onboardLocalDataSource.saveRefreshToken(loginData.refreshToken);
        }
        emit(
          AuthState.success(loginData.user),
        );
      });
    } catch (e) {
      log(e.toString());
      emit(const AuthState.error('Có lỗi xảy ra'));
    }
  }

  void _onRegister(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final registerResult =
          await _authRepository.register(event.email, event.password);
      registerResult.fold((failure) {
        emit(
          AuthState.error(failure.message),
        );
      }, (user) {
        emit(
          AuthState.success(user),
        );
      });
    } catch (e) {
      log(e.toString());
      emit(const AuthState.error('Có lỗi xảy ra'));
    }
  }

  void _onGoogleSignin(_GoogleSignin event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final firebaseAuthResult = await GoogleAuthService.signInWithGoogle();
      
      final signinResult =
          await _authRepository.signinWithGoogle(firebaseAuthResult.firebaseIdToken!);
      signinResult.fold((failure) {
        emit(AuthState.error(failure.message));
      }, (loginData) {
        if (loginData.user.isActive) {
          _onboardLocalDataSource.saveAccessToken(loginData.accessToken);
          _onboardLocalDataSource.saveRefreshToken(loginData.refreshToken);
        }
        emit(AuthState.success(loginData.user));
      });
    } catch (e) {
      log(e.toString());
      emit(const AuthState.error('Có lỗi xảy ra'));
    }
  }
}
