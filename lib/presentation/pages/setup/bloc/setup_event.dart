part of 'setup_bloc.dart';

@freezed
class SetupEvent with _$SetupEvent {
  const factory SetupEvent.setup(String name, double budget) = _Setup;
}