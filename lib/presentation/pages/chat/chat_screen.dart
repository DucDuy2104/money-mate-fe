import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:money_mate/presentation/pages/chat/widgets/message_input.dart';
import 'package:money_mate/presentation/pages/chat/widgets/message_item.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectSocket();
      getBotConversation();
    });
  }

  @override
  void dispose() {
    super.dispose();
    disconnectSocket();
    _textController.dispose();
  }

  void getBotConversation() {
    try {
      context.read<ChatBloc>().add(const ChatEvent.getChatData());
    } catch (e) {
      AppToast.error(context, 'Lỗi khi tải dữ liệu');
      debugPrint(e.toString());
    }
  }

  void onSendMessage() {
    final content = _textController.text;
    if (content.isEmpty) {
      AppToast.error(context, 'Nội dung tin nhắn không được để trống');
      return;
    }
    BlocProvider.of<ChatBloc>(context).sendMessage(content);
    _textController.clear();
  }

  void connectSocket() {
    BlocProvider.of<ChatBloc>(context).add(const ChatEvent.connect());
  }

  void disconnectSocket() {
    BlocProvider.of<ChatBloc>(context).add(const ChatEvent.disconnect());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeMap(
            loaded: (value) {
              final chatData = value.chatData;
              final conversation = chatData.conversation;
              final messages = chatData.messages;
              return LoadingScaffold(
                isLoading: state.maybeMap(
                    loading: (state) => true, orElse: () => false),
                child: Scaffold(
                  appBar: AppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(conversation.bot.name,
                            style: context.textTheme.bodyLarge),
                        Text(conversation.bot.description,
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
                    padding: const EdgeInsets.only(
                        bottom: kBottomNavigationBarHeight),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            reverse: true,
                            controller: _scrollController,
                            padding:
                                const EdgeInsets.all(AppDimens.paddingSmall),
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message = messages[index];
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
            orElse: () => LoadingScaffold(isLoading: true, child: Container()));
      },
    );
  }
}
