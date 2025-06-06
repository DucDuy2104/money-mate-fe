import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/shared/enums/category_format.dart';
import 'package:money_mate/shared/enums/socket_enum.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/helper/upload_helper.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  final SocketService _socketService = getIt<SocketService>();
  final UploadHelper _uploadHelper = getIt<UploadHelper>();
  ProfileBloc() : super(const ProfileState.initial()) {
    on<_GetData>(_onGetData);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_ReloadProfile>(_onReloadProfile);
    on<_ReloadCateogries>(_onReloadCateogries);
    on<_ReloadData>(_onReloadData);
    on<_Logout>(_onLogout);
    on<_UploadAvatar>(_onUploadAvatar);
  }

  void _onGetData(_GetData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      List<Category> categories = [];
      final categoriesResult =
          await _categoriesRepository.getOwnCategories(CategoryFormat.daily);
      categoriesResult.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (result) {
        categories = result;
      });
      final profileResult = await _usersRepository.getProfile();
      profileResult.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (profile) {
        emit(ProfileState.loaded(
            ProfileData(categories: categories, profile: profile)));
        _onConnect();
        event.callback();
      });
    } catch (e) {
      emit(const ProfileState.error("Có lỗi khi lấy thông tin"));
      debugPrint(e.toString());
      return;
    }
  }

  void _onReloadData(_ReloadData event, Emitter<ProfileState> emit) async {
    try {
      List<Category> categories = [];
      final categoriesResult =
          await _categoriesRepository.getOwnCategories(CategoryFormat.daily);
      categoriesResult.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (result) {
        categories = result;
      });
      debugPrint('categories: ${categories.length}');
      final profileResult = await _usersRepository.getProfile();
      profileResult.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (profile) {
        _onConnect();
        emit(ProfileState.loaded(
            ProfileData(categories: categories, profile: profile)));
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
          emit(ProfileState.updating(state.data));
        },
        orElse: () {});
    try {
      final updatedProfile =
          await _usersRepository.update({"name": event.name});
      updatedProfile.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (updatedProfile) {
        state.maybeMap(
            updating: (data) {
              emit(ProfileState.loaded(
                  data.data.copyWith(profile: data.data.profile.copyWith(name: updatedProfile.name))));
            },
            orElse: () {});
        event.callback();
      });
    } catch (e) {
      emit(const ProfileState.error("Có lỗi khi cập nhật"));
      debugPrint(e.toString());
      return;
    }
  }

  FutureOr<void> _onUploadAvatar(
      _UploadAvatar event, Emitter<ProfileState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(ProfileState.updating(state.data));
        },
        orElse: () {});
    try {
      final uploadUrl = await _uploadHelper.uploadFile(event.file);
      final updateResult =
          await _usersRepository.update({'avatarUrl': uploadUrl});
      updateResult.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (updatedProfile) {
        state.maybeMap(
            updating: (data) {
              emit(ProfileState.loaded(data.data.copyWith(
                  profile: data.data.profile
                      .copyWith(avatar: updatedProfile.avatar))));
            },
            orElse: () {});
      });
    } catch (e) {
      log(e.toString());
      emit(const ProfileState.error("Có lỗi khi cập nhật"));
    }
  }

  void _onReloadProfile(
      _ReloadProfile event, Emitter<ProfileState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(ProfileState.updating(state.data));
        },
        orElse: () {});
    try {
      final profile = await _usersRepository.getProfile();
      profile.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (profile) {
        state.maybeMap(
            updating: (state) {
              emit(ProfileState.loaded(state.data.copyWith(profile: profile)));
            },
            orElse: () {});
      });
    } catch (e) {
      emit(const ProfileState.error("Có lỗi khi lấy thông tin"));
      debugPrint(e.toString());
      return;
    }
  }

  void _onReloadCateogries(
      _ReloadCateogries event, Emitter<ProfileState> emit) async {
    try {
      final categories =
          await _categoriesRepository.getOwnCategories(CategoryFormat.daily);
      categories.fold((failure) {
        emit(ProfileState.error(failure.message));
      }, (categories) {
        state.maybeMap(
            loaded: (state) {
              emit(ProfileState.loaded(
                  state.data.copyWith(categories: categories)));
            },
            orElse: () {});
      });
    } catch (e) {
      emit(const ProfileState.error("Có l��i khi lấy danh mục"));
      debugPrint(e.toString());
      return;
    }
  }

  User? getProfile() {
    return state.maybeMap(
        updating: (state) => state.data.profile,
        loaded: (state) => state.data.profile,
        orElse: () => null);
  }

  void _onConnect() {
    _socketService.listen(SocketEnum.newTransaction.name, (data) {
      add(const _ReloadData());
    });

    _socketService.listen(SocketEnum.updateCategory.name, (data) {
      add(const _ReloadProfile());
    });
  }

  void _onLogout(_Logout event, Emitter<ProfileState> emit) {
    emit(const ProfileState.initial());
  }
}
