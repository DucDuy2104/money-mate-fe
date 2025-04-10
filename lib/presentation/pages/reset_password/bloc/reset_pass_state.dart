part of 'reset_pass_bloc.dart';

@freezed
class ResetPassState with _$ResetPassState {
  const factory ResetPassState.initial() = _Initial;
  const factory ResetPassState.loading() = _Loading;
  const factory ResetPassState.success(User user) = _Success;
  const factory ResetPassState.error(String error) = _Error;
}
