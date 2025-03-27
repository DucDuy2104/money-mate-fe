import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSendMessage;

  const MessageInput(
      {super.key, required this.textController, required this.onSendMessage});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
      ),
    );
  }
}
