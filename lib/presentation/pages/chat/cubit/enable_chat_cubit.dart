import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/network/models/count_paginated_state.dart';
import 'package:photo_manager/photo_manager.dart';

part 'enable_chat_state.dart';
part 'enable_chat_cubit.freezed.dart';

const int assetsPerPage = 50;

class EnableChatCubit extends Cubit<EnableChatState>
    with CountPaginatedMixin<AssetEntity> {
  EnableChatCubit() : super(const EnableChatState.initial());
  void sendAvailable() {
    emit(const EnableChatState.sendAvailable());
  }

  void openGallery() async {
    emit(EnableChatState.galleryOpening(data: CountPaginatedState()));
    final curState = state.maybeMap(
        galleryOpening: (state) {
          return state;
        },
        orElse: () => null);
    if (curState == null) return;
    final totalPage = await getAssetPageCount();
    if (totalPage == 0) return;
    final result = await getAssetsFromGallery(0);
    result.fold((failure) {}, (items) {
      emit(EnableChatState.galleryOpening(
          data: handleFirstFetch(
              items, curState.data.copyWith(totalPage: totalPage))));
    });
  }

  void loadMoreImages() async {
    final curState = state.maybeMap(
        galleryOpening: (state) {
          return state;
        },
        orElse: () => null);
    if (curState == null) return;
    if (!curState.data.hasNext) return;
    final result = await getAssetsFromGallery(curState.data.currentPage + 1);
    result.fold((failure) {}, (items) {
      emit(EnableChatState.galleryOpening(
          data: handleFetchMore(items, curState.data)));
    });
  }

  void closeGallery() {
    emit(const EnableChatState.initial());
  }

  void toggleAsset(AssetEntity asset) {
    final curState = state.maybeMap(
      galleryOpening: (state) => state,
      orElse: () => null,
    );

    if (curState == null) return;

    final isSelected = curState.selectedAssets.contains(asset);
    final updatedAssets = isSelected
        ? curState.selectedAssets.where((e) => e != asset).toList()
        : [...curState.selectedAssets, asset];

    emit(curState.copyWith(selectedAssets: updatedAssets));
  }

  void setImageSending() {
    final curState =
        state.maybeMap(galleryOpening: (value) => value, orElse: () => null);
    if (curState == null) return;
    emit(curState.copyWith(isSending: true));
  }

  void setSendingComplete() {
    final curState = state.maybeMap(
      galleryOpening: (value) => value,
      orElse: () => null,
    );
    if (curState == null) return;
    emit(curState.copyWith(isSending: false));
  }

  void clear() {
    final curState = state.maybeMap(
      galleryOpening: (value) => value,
      orElse: () => null,
    );
    if (curState == null) return;
    emit(curState.copyWith(selectedAssets: []));
  }
}

Future<Either<String, List<AssetEntity>>> getAssetsFromGallery(int page) async {
  try {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    List<AssetEntity> assets = [];
    if (ps.isAuth) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
      );

      if (albums.isNotEmpty) {
        final AssetPathEntity album = albums.first;

        final totalPage =
            ((await album.assetCountAsync) / assetsPerPage).ceil();

        if (page >= totalPage) {
          return const Right([]);
        }

        assets = await album.getAssetListPaged(
          page: page,
          size: assetsPerPage,
        );
      }
    }
    return Right(assets);
  } catch (e) {
    return Left('Error: $e');
  }
}

Future<int> getAssetPageCount() async {
  final PermissionState ps = await PhotoManager.requestPermissionExtend();

  int totalPage = 0;

  if (ps.isAuth) {
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );

    if (albums.isNotEmpty) {
      final AssetPathEntity album = albums.first;

      totalPage = ((await album.assetCountAsync) / assetsPerPage).ceil();
    }
  }

  return totalPage;
}
