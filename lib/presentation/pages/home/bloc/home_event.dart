part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getData(VoidCallback callback) = _GetData;
  const factory HomeEvent.reloadData() = _ReloadData;
  const factory HomeEvent.connect() = _Connect;
  const factory HomeEvent.reloadCategories() = _ReloadCategories;
}