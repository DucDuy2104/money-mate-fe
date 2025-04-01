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

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UsersRepository _usersRepository = getIt<UsersRepository>();
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  final SocketService _socketService = getIt<SocketService>();
  ProfileBloc() : super(const ProfileState.initial()) {
    on<_GetData>(_onGetProfile);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_ReloadProfile>(_onReloadProfile);
    on<_ReloadCateogries>(_onReloadCateogries);
  }

  void _onGetProfile(_GetData event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    await Future.delayed(const Duration(seconds: 4));
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
          emit(ProfileState.updating(state.data));
        },
        orElse: () {});
    await Future.delayed(const Duration(seconds: 2));
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
      add(const _ReloadCateogries());
    });

    _socketService.listen(SocketEnum.updateCategory.name, (data) {
      add(const _ReloadCateogries());
    });
  }
}
