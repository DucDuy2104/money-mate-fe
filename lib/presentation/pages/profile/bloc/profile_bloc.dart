import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  ProfileBloc() : super(const ProfileState.initial()) {
    on<_GetProfile>(_onGetProfile);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_ReloadProfile>(_onReloadProfile);
  }

  void _onGetProfile(_GetProfile event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    await Future.delayed(const Duration(seconds: 4));
    try {
      final profile = await _usersRepository.getProfile();
      profile.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (profile) {
        emit(ProfileState.loaded(profile));
      });
    } catch (e) {
      emit(const ProfileState.error("Có lỗi khi lấy thông tin"));
      debugPrint(e.toString());
      return;
    }
  }

  void _onUpdateProfile(
      _UpdateProfile event, Emitter<ProfileState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(ProfileState.updating(state.profile));
        },
        orElse: () {});
    await Future.delayed(const Duration(seconds: 2));
    try {
      final updatedProfile =
          await _usersRepository.update({"name": event.name});
      updatedProfile.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (updatedProfile) {
        event.callback();
      });
    } catch (e) {
      emit(const ProfileState.error("Có lỗi khi cập nhật"));
      debugPrint(e.toString());
      return;
    }
  }

  void _onReloadProfile(
      _ReloadProfile event, Emitter<ProfileState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(ProfileState.updating(state.profile));
        },
        orElse: () {});
    await Future.delayed(const Duration(seconds: 2));
    try {
      final profile = await _usersRepository.getProfile();
      profile.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (profile) {
        emit(ProfileState.loaded(profile));
      });
    } catch (e) {
      emit(const ProfileState.error("Có lỗi khi lấy thông tin"));
      debugPrint(e.toString());
      return;
    }
  }
}
