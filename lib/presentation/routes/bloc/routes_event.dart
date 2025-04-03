part of 'routes_bloc.dart';

@freezed
class RoutesEvent with _$RoutesEvent {
  const factory RoutesEvent.startUp() = _StartUp;
  const factory RoutesEvent.setAuth() = _SetAuth;
  const factory RoutesEvent.logout(BuildContext context) = _Logout;
}