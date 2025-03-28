import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/presentation/pages/chat/widgets/confirm_message.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/message_type.dart';
import 'package:money_mate/shared/extensions/datetime_ext.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  const MessageItem({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
      child: Row(
        mainAxisAlignment: message.isSentByMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: message.isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                      color: message.isSentByMe
                          ? AppColors.darkCardColor
                          : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(message.isSentByMe ? 20 : 4),
                        topRight: Radius.circular(message.isSentByMe ? 4 : 20),
                        bottomLeft:
                            Radius.circular(message.isSentByMe ? 20 : 20),
                        bottomRight:
                            Radius.circular(message.isSentByMe ? 20 : 20),
                      )),
                  child: Text(
                    message.content,
                    style: TextStyle(
                      fontSize: 15,
                      color: message.isSentByMe ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                if (!message.isSentByMe && message.type == MessageType.transaction) ...[
                  AppDimens.spaceSmall,
                  TransactionInfoMessage(
                    amount: 12000,
                    category: "Ăn uống",
                    onCancel: () {
                      // Handle confirmation
                      print(
                          "User confirmed adding expense to Ăn uống category");
                    },
                  )
                ],
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: Text(message.createdAt.toHourMinute(),
                      style: context.textTheme.bodySmall
                          ?.copyWith(fontSize: 10, color: AppColors.subText)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
