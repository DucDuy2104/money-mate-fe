import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/pages/chat/cubit/enable_chat_cubit.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSendMessage;
  final VoidCallback onOpenGallery;
  final VoidCallback onCloseGallery;
  final FocusNode focusNode;

  const MessageInput(
      {super.key,
      required this.textController,
      required this.onSendMessage,
      required this.focusNode,
      required this.onOpenGallery,
      required this.onCloseGallery});
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: focusNode,
            controller: textController,
            onSubmitted: (text) {
              onSendMessage();
              textController.clear();
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                context.read<EnableChatCubit>().sendAvailable();
              } else {
                context.read<EnableChatCubit>().closeGallery();
              }
            },
            decoration: InputDecoration(
              suffixIcon: BlocBuilder<EnableChatCubit, EnableChatState>(
                  builder: (context, state) {
                return state.maybeMap(
                    galleryOpening: (value) => IconButton(
                          icon: const Icon(
                            EvaIcons.image2,
                            size: AppDimens.iconSize,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => onCloseGallery(),
                        ),
                    sendAvailable: (value) => IconButton(
                          icon: const Icon(
                            EvaIcons.navigation,
                            size: AppDimens.iconSize,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => onSendMessage(),
                        ),
                    initial: (value) => IconButton(
                          icon: const Icon(
                            EvaIcons.imageOutline,
                            size: AppDimens.iconSize,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => onOpenGallery(),
                        ),
                    orElse: () => IconButton(
                          icon: const Icon(
                            EvaIcons.imageOutline,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => onOpenGallery(),
                        ));
              }),
              hintText: s.whatBudgetYouSpent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                borderSide: const BorderSide(color: AppColors.subText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
