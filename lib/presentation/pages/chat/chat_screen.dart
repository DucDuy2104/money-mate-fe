import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:money_mate/presentation/pages/chat/cubit/enable_chat_cubit.dart';
import 'package:money_mate/presentation/pages/chat/widgets/bot_dialog.dart';
import 'package:money_mate/presentation/pages/chat/widgets/image_picker_section/image_picker_section.dart';
import 'package:money_mate/presentation/pages/chat/widgets/message_input.dart';
import 'package:money_mate/presentation/pages/chat/widgets/message_item.dart';
import 'package:money_mate/presentation/pages/chat/widgets/typing_indicator.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:photo_manager/photo_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectSocket();
      getBotConversation();
      scrollerListener();
    });
  }

  void scrollerListener() {
    _scrollController.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }

      onCloseGallery();

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        onScrollToBottom();
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        onCloseGallery();
      }
    });
  }

  void onScrollToBottom() {
    BlocProvider.of<ChatBloc>(context).add(const ChatEvent.loadMoreMessages());
  }

  void getBotConversation() {
    try {
      context.read<ChatBloc>().add(const ChatEvent.getChatData());
    } catch (e) {
      AppToast.error(context, 'Lỗi khi tải dữ liệu');
      debugPrint(e.toString());
    }
  }

  void onSendImageMessage(List<AssetEntity> assets) {
    context.read<EnableChatCubit>().setImageSending();
    context.read<ChatBloc>().sendImageMessage(assets, () {
      context.read<EnableChatCubit>().setSendingComplete();
    });
    context.read<EnableChatCubit>().clear();
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

  void onCloseGallery() {
    BlocProvider.of<EnableChatCubit>(context).closeGallery();
  }

  void onOpenGallery() {
    _focusNode.unfocus();
    BlocProvider.of<EnableChatCubit>(context).openGallery();
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
              final messages = chatData.messageData.data;
              return LoadingScaffold(
                isLoading: state.maybeMap(
                    loading: (state) => true, orElse: () => false),
                child: Scaffold(
                  appBar: AppBar(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(conversation.bot.name,
                              style: context.textTheme.bodyLarge),
                          Text(conversation.bot.description,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: AppColors.subText)),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(EvaIcons.moreVertical),
                        onPressed: () {
                          showUpdateBotDialog(context, conversation.bot,
                              (updateBot) {
                            BlocProvider.of<ChatBloc>(context)
                                .add(ChatEvent.updateBot(context, updateBot));
                          });
                        },
                      ),
                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.paddingMd),
                          itemCount:
                              messages.isNotEmpty && messages[0].isSentByMe
                                  ? messages.length + 1
                                  : messages.length,
                          itemBuilder: (context, index) {
                            if (index == 0 && messages[0].isSentByMe) {
                              return const TypingIndicator();
                            }
                            final id =
                                messages[0].isSentByMe ? index - 1 : index;
                            final message = messages[id];
                            return MessageItem(message: message);
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(AppDimens.paddingMd),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                        ),
                        child: MessageInput(
                          textController: _textController,
                          onSendMessage: onSendMessage,
                          focusNode: _focusNode,
                          onOpenGallery: onOpenGallery,
                          onCloseGallery: onCloseGallery,
                        ),
                      ),
                      BlocBuilder<EnableChatCubit, EnableChatState>(
                          builder: (context, state) {
                        return state.maybeMap(
                            galleryOpening: (value) => GalleryPicker(
                                  onSendImages: onSendImageMessage,
                                  goToCamera: () {},
                                ),
                            orElse: () => const SizedBox());
                      })
                    ],
                  ),
                ),
              );
            },
            orElse: () => LoadingScaffold(isLoading: true, child: Container()));
      },
    );
  }
}
