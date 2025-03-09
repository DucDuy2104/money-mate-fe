import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/transaction_types.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';
import 'package:money_mate/shared/helper/time_helper.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function()? onTap;

  const TransactionItem({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    final formattedDate = TimeHelper.formatFriendlyDate(transaction.date);
    final formattedAmount = CurrencyHelper.formatCurrency(transaction.amount);

    final Color amountColor = transaction.type == TransactionTypes.income
        ? AppColors.upColor
        : AppColors.downColor;

    final IconData transactionIcon = transaction.type == TransactionTypes.income
        ? EvaIcons.arrowDownwardOutline
        : EvaIcons.arrowUpwardOutline;

    return Card(
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: amountColor.withOpacity(0.2),
          child: Icon(
            transactionIcon,
            color: amountColor,
          ),
        ),
        title: Text(
          transaction.title,
          style: context.textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (transaction.description.isNotEmpty)
              Text(
                transaction.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            Text(
              formattedDate,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: AppColors.subText),
            ),
          ],
        ),
        trailing: Text(formattedAmount, style: context.textTheme.titleMedium?.copyWith(
          color: amountColor
        )),
      ),
    );
  }
}
