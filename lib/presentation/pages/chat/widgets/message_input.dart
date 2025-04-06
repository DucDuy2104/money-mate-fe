import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSendMessage;
  final FocusNode focusNode;

  const MessageInput(
      {super.key, required this.textController, required this.onSendMessage, required this.focusNode});
  @override
  Widget build(BuildContext context) {
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
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(
                  EvaIcons.navigation,
                  color: AppColors.primaryColor,
                ),
                onPressed: () => onSendMessage(),
              ),
              hintText: "Bạn vừa chi tiền vào thứ gì?",
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.borderRadiusMedium),
                borderSide: const BorderSide(color: AppColors.subText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
