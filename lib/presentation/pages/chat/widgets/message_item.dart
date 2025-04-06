import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/presentation/pages/category/widgets/category_dialogs.dart';
import 'package:money_mate/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:money_mate/presentation/pages/chat/widgets/suggest_category.dart';
import 'package:money_mate/presentation/pages/chat/widgets/transaction_dialogs.dart';
import 'package:money_mate/presentation/pages/chat/widgets/transaction_message.dart';
import 'package:money_mate/presentation/pages/chat/widgets/switch_category_item.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/message_type.dart';
import 'package:money_mate/shared/extensions/datetime_ext.dart';

class MessageItem extends StatefulWidget {
  final Message message;
  const MessageItem({super.key, required this.message});

  @override
  // ignore: library_private_types_in_public_api
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create slide animation (sliding from right or left based on message origin)
    _slideAnimation = Tween<Offset>(
      begin: Offset(widget.message.isSentByMe ? 0.1 : -0.1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Create fade animation
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppDimens.paddingSmall),
          child: Row(
            mainAxisAlignment: widget.message.isSentByMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: widget.message.isSentByMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding,
                        vertical: AppDimens.paddingMedium,
                      ),
                      decoration: BoxDecoration(
                          color: widget.message.isSentByMe
                              ? AppColors.darkCardColor
                              : (widget.message.type == MessageType.error
                                  ? Colors.pinkAccent
                                  : Colors.grey[200]),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.message.isSentByMe
                                ? AppDimens.borderRadiusMedium
                                : AppDimens.borderRadiusSmall / 2),
                            topRight: Radius.circular(widget.message.isSentByMe
                                ? AppDimens.borderRadiusSmall / 2
                                : AppDimens.borderRadiusMedium),
                            bottomLeft: Radius.circular(
                                widget.message.isSentByMe
                                    ? AppDimens.borderRadiusMedium
                                    : AppDimens.borderRadiusMedium),
                            bottomRight: Radius.circular(
                                widget.message.isSentByMe
                                    ? AppDimens.borderRadiusMedium
                                    : AppDimens.borderRadiusMedium),
                          )),
                      child: Text(
                        widget.message.content,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: widget.message.isSentByMe
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ),
                    if (!widget.message.isSentByMe &&
                        widget.message.type == MessageType.transaction) ...[
                      AppDimens.spaceSmall,
                      TransactionInfoMessage(
                        transaction: widget.message.transaction!,
                        onCancel: () {
                          TransactionDialogs.showCancelTransactionDialog(
                              context,
                              widget.message.transaction!,
                              onCancelTransaction);
                        },
                        onEnable: () {
                          TransactionDialogs.showEnableTransactionDialog(
                              context,
                              widget.message.transaction!,
                              onEnableTransaction);
                        },
                      )
                    ],
                    if (!widget.message.isSentByMe &&
                            widget.message.type == MessageType.add ||
                        widget.message.type == MessageType.delete) ...[
                      AppDimens.spaceSmall,
                      SwitchCategoryItem(
                        category: widget.message.category!,
                        type: widget.message.type,
                      )
                    ],
                    if (!widget.message.isSentByMe &&
                        widget.message.type == MessageType.recommend) ...[
                      AppDimens.spaceSmall,
                      SuggestCategoryItem(
                        category: widget.message.category!,
                        onApprove: () {
                          CategoryDialogs.showAddCategoryDialog(
                              context, widget.message.category!, (budget) {
                            BlocProvider.of<ChatBloc>(context).sendMessage(
                                "Thêm danh mục '${widget.message.category!.name}' với ngân sách $budget ( Tin nhắn tự động )");
                          }, () {});
                        },
                      )
                    ],
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppDimens.paddingSmall / 2,
                          left: AppDimens.paddingMedium,
                          right: AppDimens.paddingMedium),
                      child: Text(widget.message.createdAt.toHourMinute(),
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: AppColors.subText)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCancelTransaction() {
    BlocProvider.of<ChatBloc>(context)
        .add(ChatEvent.cancelTransaction(widget.message, context, reloadData));
  }

  void onEnableTransaction() {
    BlocProvider.of<ChatBloc>(context)
        .add(ChatEvent.enableTransaction(widget.message, context, reloadData));
  }

  void reloadData() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final profileBloc = BlocProvider.of<ProfileBloc>(context);

    homeBloc.add(const HomeEvent.reloadData());
    profileBloc.add(const ProfileEvent.reloadData());
  }
}
