part of 'routes_bloc.dart';

@freezed
class RoutesState with _$RoutesState {
  const factory RoutesState.initial() = _Initial;
  const factory RoutesState.auth() = _Auth;
  const factory RoutesState.startedUp() = _StartedUp;
  const factory RoutesState.error(String message) = _Error;
}
