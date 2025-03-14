import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/presentation/pages/chat/widgets/confirm_message.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class ChatMessage {
  final String text;
  final bool isSentByMe;
  final String time;

  ChatMessage({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();

  void _handleSubmitted(String text) {
    _textController.clear();

    if (text.trim().isEmpty) return;

    final message = ChatMessage(
      text: text,
      isSentByMe: true,
      time:
          '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
    );

    setState(() {
      _messages.add(message);
    });

    // Auto-reply for demo purposes
    Future.delayed(Duration(seconds: 1), () {
      final reply = ChatMessage(
        text: 'Đây là tin nhắn tự động phản hồi: "$text"',
        isSentByMe: false,
        time:
            '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
      );

      setState(() {
        _messages.add(reply);
      });

      _scrollToBottom();
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Eva', style: context.textTheme.bodyLarge),
            Text('Money Mate bot',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: AppColors.subText)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.moreVertical),
            onPressed: () {
              // TODO: go to chat settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(AppDimens.paddingSmall),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageItem(message);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
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
                ExpenseConfirmMessage(
                  amount: 12000,
                  category: "Ăn uống",
                  onConfirm: () {
                    // Handle confirmation
                    print("User confirmed adding expense to Ăn uống category");
                  },
                  onDecline: () {
                    // Handle decline
                    print("User declined");
                  },
                ),
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
                    message.text,
                    style: TextStyle(
                      fontSize: 15,
                      color: message.isSentByMe ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: Text(message.time,
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

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    EvaIcons.navigation,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () => _handleSubmitted(_textController.text),
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
