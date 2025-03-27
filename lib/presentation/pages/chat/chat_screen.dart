import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/conversation.dart';
import 'package:money_mate/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:money_mate/presentation/pages/chat/widgets/message_input.dart';
import 'package:money_mate/presentation/pages/chat/widgets/message_item.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBotConversation();
    });
  }

  void getBotConversation() {
    try {
      context.read<ChatBloc>().add(const ChatEvent.getConversation());
    } catch (e) {
      AppToast.error(context, 'Lỗi khi tải dữ liệu');
      debugPrint(e.toString());
    }
  }

  void onSendMessage() {
    final content = _textController.text;
    _textController.clear();

    if (content.trim().isEmpty) return;

    final message = ChatMessage(
      text: content,
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
        text: 'Đây là tin nhắn tự động phản hồi: "$content"',
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
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        final Conversation? conversation = state.maybeMap(
            loaded: (data) => data.conversation, orElse: () => null);
        final botName = conversation?.bot.name ?? "";
        final botDesc = conversation?.bot.description ?? "";
        return LoadingScaffold(
          isLoading:
              state.maybeMap(loading: (state) => true, orElse: () => false),
          child: Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(botName, style: context.textTheme.bodyLarge),
                  Text(botDesc,
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
              padding:
                  const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(AppDimens.paddingSmall),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return MessageItem(message: message);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: MessageInput(
                        textController: _textController,
                        onSendMessage: onSendMessage),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
