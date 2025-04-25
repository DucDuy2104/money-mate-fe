import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/chat/cubit/enable_chat_cubit.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryPicker extends StatefulWidget {
  final Function(List<AssetEntity>) onSendImages;
  final VoidCallback goToCamera;

  const GalleryPicker({
    super.key,
    required this.onSendImages,
    required this.goToCamera,
  });

  @override
  State<GalleryPicker> createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<GalleryPicker> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<EnableChatCubit>().loadMoreImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnableChatCubit, EnableChatState>(
      builder: (context, state) {
        return state.maybeMap(
          galleryOpening: (state) {
            final entities = state.data.data;
            final selectedAssets = state.selectedAssets;

            return SizedBox(
              height: 313,
              child: Stack(
                children: [
                  Container(
                    color: Colors.black87,
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: entities.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return GestureDetector(
                            onTap: widget.goToCamera,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[800],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      EvaIcons.cameraOutline,
                                      size: AppDimens.iconSize,
                                      color: Colors.white70,
                                    ),
                                    AppDimens.spaceSm,
                                    Text(
                                      'Chụp ảnh',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Colors.white70,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }

                        final asset = entities[index - 1];
                        final isSelected = selectedAssets.contains(asset);
                        final selectionIndex =
                            selectedAssets.indexOf(asset) + 1;

                        return AssetThumbnail(
                          asset: asset,
                          isSelected: isSelected,
                          selectionIndex: selectionIndex,
                          onTap: () => context
                              .read<EnableChatCubit>()
                              .toggleAsset(asset),
                        );
                      },
                    ),
                  ),

                  // Send button
                  if (selectedAssets.isNotEmpty)
                    Positioned(
                      bottom: AppDimens.paddingMd,
                      right: AppDimens.paddingMd,
                      child: FloatingActionButton(
                        backgroundColor: AppColors.primaryColor,
                        onPressed: state.isSending
                            ? null
                            : () => widget.onSendImages(selectedAssets),
                        child: state.isSending
                            ? const CircularProgressIndicator()
                            : const Icon(
                                EvaIcons.paperPlane,
                                color: Colors.white,
                                size: AppDimens.iconSize,
                              ),
                      ),
                    ),
                ],
              ),
            );
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
        );
      },
    );
  }
}

class AssetThumbnail extends StatefulWidget {
  final AssetEntity asset;
  final bool isSelected;
  final int selectionIndex;
  final VoidCallback onTap;

  const AssetThumbnail({
    super.key,
    required this.asset,
    required this.isSelected,
    required this.selectionIndex,
    required this.onTap,
  });

  @override
  State<AssetThumbnail> createState() => _AssetThumbnailState();
}

class _AssetThumbnailState extends State<AssetThumbnail> {
  dynamic thumbnailData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  Future<void> _loadThumbnail() async {
    try {
      final thumbnail = await widget.asset.thumbnailData;
      if (mounted) {
        setState(() {
          thumbnailData = thumbnail;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primaryColor,
          ),
        ),
      );
    }

    if (thumbnailData == null) {
      return Container(
        color: Colors.black45,
        child: const Center(
          child: Icon(
            EvaIcons.imageOutline,
            color: Colors.white54,
            size: AppDimens.iconSize,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.memory(
            thumbnailData,
            fit: BoxFit.cover,
            cacheWidth: 300,
          ),
          if (widget.isSelected)
            Container(
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
          Positioned(
            top: AppDimens.paddingSm,
            left: AppDimens.paddingSm,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: widget.isSelected
                  ? Center(
                      child: Text(
                        '${widget.selectionIndex}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
