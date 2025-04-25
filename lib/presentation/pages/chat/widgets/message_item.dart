import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/presentation/pages/category/widgets/category_dialogs.dart';
import 'package:money_mate/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:money_mate/presentation/pages/chat/cubit/selected_invoices_cubit.dart';
import 'package:money_mate/presentation/pages/chat/widgets/invoice_item_ui.dart';
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
import 'package:money_mate/shared/extensions/invoice_items_ext.dart';

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
    final s = S.of(context);
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppDimens.paddingXs),
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
                    widget.message.content == null ||
                            widget.message.content!.isEmpty
                        ? const SizedBox()
                        : Container(
                            constraints: BoxConstraints(
                              maxWidth: widget.message.isSentByMe
                                  ? MediaQuery.of(context).size.width * 0.7
                                  : MediaQuery.of(context).size.width * 0.8,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.paddingMd,
                              vertical: AppDimens.paddingMd,
                            ),
                            decoration: BoxDecoration(
                                color: widget.message.isSentByMe
                                    ? AppColors.darkCardColor
                                    : (widget.message.type == MessageType.error
                                        ? Colors.pinkAccent
                                        : Colors.grey[200]),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      widget.message.isSentByMe
                                          ? AppDimens.radiusMd
                                          : AppDimens.radiusSm / 2),
                                  topRight: Radius.circular(
                                      widget.message.isSentByMe
                                          ? AppDimens.radiusSm / 2
                                          : AppDimens.radiusMd),
                                  bottomLeft: Radius.circular(
                                      widget.message.isSentByMe
                                          ? AppDimens.radiusMd
                                          : AppDimens.radiusMd),
                                  bottomRight: Radius.circular(
                                      widget.message.isSentByMe
                                          ? AppDimens.radiusMd
                                          : AppDimens.radiusMd),
                                )),
                            child: Text(
                              widget.message.content!,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: widget.message.isSentByMe
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                    if (!widget.message.isSentByMe &&
                        widget.message.type == MessageType.transaction) ...[
                      AppDimens.spaceSm,
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
                      AppDimens.spaceSm,
                      SwitchCategoryItem(
                        category: widget.message.category!,
                        type: widget.message.type,
                      )
                    ],
                    if (!widget.message.isSentByMe &&
                        widget.message.type == MessageType.recommend) ...[
                      AppDimens.spaceSm,
                      SuggestCategoryItem(
                        category: widget.message.category!,
                        onApprove: () {
                          CategoryDialogs.showAddCategoryDialog(
                              context, widget.message.category!, (budget) {
                            BlocProvider.of<ChatBloc>(context).sendMessage(
                                s.addBudgetCategoryAutoMessage(
                                    widget.message.category!.name, budget));
                          }, () {});
                        },
                      )
                    ],
                    if (widget.message.type == MessageType.image &&
                        widget.message.assets.isNotEmpty) ...[
                      AppDimens.spaceSm,
                      _renderImages(
                          widget.message,
                          context,
                          MediaQuery.of(context).size.width * 0.7,
                          widget.message.isSentByMe)
                    ],
                    if (widget.message.type == MessageType.invoice &&
                        widget.message.invoiceItems != null) ...[
                      AppDimens.spaceSm,
                      ...widget.message.invoiceItems!.map((item) {
                        return Column(
                          children: [
                            InvoiceItemUI(
                              item: item,
                              onSelectChanged: () {
                                context
                                    .read<SelectedInvoicesCubit>()
                                    .toggleInvoiceSelection(item);
                              },
                            ),
                            if (item != widget.message.invoiceItems!.last)
                              AppDimens.divider,
                          ],
                        );
                      }),
                      AppDimens.divider,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: context.theme.elevatedButtonTheme.style
                                      ?.copyWith(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<SelectedInvoicesCubit>()
                                        .addAll(widget.message.invoiceItems!);
                                  },
                                  child: Text(
                                    'Chọn tất cả',
                                    style: context.textTheme.titleMedium,
                                  )),
                            ),
                            AppDimens.divider,
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    final invoiceItems = context
                                        .read<SelectedInvoicesCubit>()
                                        .getList();
                                    if(invoiceItems.isEmpty) return;
                                    context
                                        .read<ChatBloc>()
                                        .sendMessage(invoiceItems.toMessage());
                                    context
                                        .read<SelectedInvoicesCubit>()
                                        .clear();
                                  },
                                  child: Text(
                                    'Xác nhận',
                                    style: context.textTheme.titleMedium,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppDimens.paddingXs,
                          left: AppDimens.paddingMd,
                          right: AppDimens.paddingMd),
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

Widget _renderImages(
    Message message, BuildContext context, double maxWidth, bool isInMenu) {
  final files = message.assets;
  final fileCount = files.length;
  final isLastMessseExpand = fileCount % 2 != 0;
  const gap = 2;
  return SizedBox(
    width: maxWidth,
    child: Wrap(
      children: files.asMap().entries.map((entry) {
        final isLast = entry.key == files.length - 1;
        final isExpand = isLast && isLastMessseExpand;
        return Padding(
          padding: const EdgeInsets.all(gap / 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radiusSm),
            child: Hero(
              tag: 'asset ${entry.value}',
              child: GestureDetector(
                onTap: () {
                  // if (!isInMenu) {
                  //   context.pushNamed(AppRoutes.viewMediaName,
                  //       extra: entry.value);
                  // }
                },
                child: CachedNetworkImage(
                    imageUrl: entry.value,
                    width: isExpand ? maxWidth : (maxWidth / 2 - gap),
                    height: isExpand ? null : maxWidth / 2 - gap,
                    fit: isExpand ? BoxFit.contain : BoxFit.cover),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
