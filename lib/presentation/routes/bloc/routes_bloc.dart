import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/langs/cubit/locale_cubit.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/core/service/getit/locator.dart' as ls;
import 'package:money_mate/shared/constants/app_constants.dart';

part 'routes_event.dart';
part 'routes_state.dart';
part 'routes_bloc.freezed.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  late final OnboardLocalDataSource _dataSource;
  late final SocketService _service;
  RoutesBloc() : super(const RoutesState.initial()) {
    on<_SetAuth>(_onSetAuth);
    on<_StartUp>(_onStartUp);
    on<_Logout>(_onLogout);
  }

  void _onSetAuth(_SetAuth event, Emitter<RoutesState> emit) async {
    await _dataSource.setAuthenticated();
    emit(const RoutesState.auth());
  }

  void _onStartUp(_StartUp event, Emitter<RoutesState> emit) async {
    try {
      // Initialize app box
      // await AppStorageService.init();
      // Add any other initialization tasks here
      await ls.setupLocator();
      await Future.delayed(const Duration(seconds: 2));
      _dataSource = getIt<OnboardLocalDataSource>();
      _service = getIt<SocketService>();
      // ignore: use_build_context_synchronously
      BlocProvider.of<LocaleCubit>(event.context).loadLocale();
      final isAuthenticated = _dataSource.isAuthenticated();
      if (isAuthenticated) {
        emit(const RoutesState.auth());
        return;
      }
      emit(const RoutesState.startedUp());
    } catch (e) {
      emit(RoutesState.error(e.toString()));
    }
  }

  void _onLogout(_Logout event, Emitter<RoutesState> emit) async {
    await _dataSource.logout();
    _service.disconnect();
    emit(const RoutesState.startedUp());
  }
}
