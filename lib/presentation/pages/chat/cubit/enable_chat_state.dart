part of 'enable_chat_cubit.dart';

@freezed
class EnableChatState with _$EnableChatState {
  const factory EnableChatState.initial() = _Initial;
  const factory EnableChatState.sendAvailable() = _SendAvailable;
  const factory EnableChatState.galleryOpening(
      {required CountPaginatedState<AssetEntity> data,
      @Default([]) List<AssetEntity> selectedAssets,@Default(false) bool isSending}) = _GalleryOpening;
}