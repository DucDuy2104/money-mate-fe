import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class TransactionInfoMessage extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onCancel;
  final VoidCallback onEnable;

  const TransactionInfoMessage({
    super.key,
    required this.transaction,
    required this.onCancel,
    required this.onEnable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0.5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.paddingMedium, horizontal: AppDimens.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimens.paddingSmall),
                decoration: BoxDecoration(
                  color: transaction.category.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                ),
                child: Icon(
                  transaction.category.icon,
                  color: transaction.category.color,
                  size: AppDimens.iconSize,
                ),
              ),
              AppDimens.spaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.category.name,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          transaction.category.type.name,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: AppColors.subText,
                          ),
                        ),
                        AppDimens.divider,
                        Text(
                          '• ${_formatDate(transaction.createdAt)} ${_formatTime(transaction.createdAt)}',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: AppColors.subText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildActionButton(),
            ],
          ),
          AppDimens.spaceSmall,
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.paddingSmall),
                  decoration: BoxDecoration(
                    color: transaction.amount >= 0
                        ? Colors.teal[50]
                        : Colors.red[50],
                    borderRadius:
                        BorderRadius.circular(AppDimens.borderRadiusSmall),
                  ),
                  child: Text(
                    CurrencyHelper.formatCurrencyCompact(transaction.amount),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.teal[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (transaction.description.isNotEmpty) ...[
                AppDimens.spaceSmall,
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.paddingSmall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      transaction.description,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[800],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    if (transaction.isLoading) {
      return SizedBox(
        width: AppDimens.iconSize,
        height: AppDimens.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[600]!),
        ),
      );
    } else if (transaction.isCancel) {
      return GestureDetector(
        onTap: onEnable,
        child: Icon(
          Icons.refresh,
          color: Colors.grey[600],
          size: AppDimens.iconSizeSmall,
        ),
      );
    } else {
      return GestureDetector(
        onTap: onCancel,
        child: Icon(
          Icons.close,
          color: Colors.grey[600],
          size: AppDimens.iconSizeSmall,
        ),
      );
    }
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
