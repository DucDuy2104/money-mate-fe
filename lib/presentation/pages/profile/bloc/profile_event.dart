part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getData(VoidCallback callback) = _GetData;
  const factory ProfileEvent.reloadProfile() = _ReloadProfile;
  const factory ProfileEvent.updateProfile(String name, VoidCallback callback) = _UpdateProfile;
  const factory ProfileEvent.uploadAvatar(File file) = _UploadAvatar;
  const factory ProfileEvent.reloadCateogries() = _ReloadCateogries;
  const factory ProfileEvent.reloadData() = _ReloadData;
  const factory ProfileEvent.logout() = _Logout;
}