part of 'email_next_bloc.dart';

@freezed
class EmailNextEvent with _$EmailNextEvent {
  const factory EmailNextEvent.next(String email) = _Next;
}