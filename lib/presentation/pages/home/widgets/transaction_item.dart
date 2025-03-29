import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';
import 'package:money_mate/shared/helper/time_helper.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function()? onTap;

  const TransactionItem({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    final formattedDate = TimeHelper.formatFriendlyDate(transaction.createdAt);
    final formattedAmount = CurrencyHelper.formatCurrency(transaction.amount);

    final Color amountColor = transaction.category.type == CategoriesType.income
        ? AppColors.upColor
        : AppColors.downColor;

    return Card(
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: transaction.category.color.withOpacity(0.2),
          child: Icon(
            transaction.category.icon,
            color: transaction.category.color,
          ),
        ),
        title: Text(
          transaction.category.name,
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
        trailing: Text(
          transaction.category.type == CategoriesType.income 
              ? "+$formattedAmount" 
              : "-$formattedAmount",
          style: context.textTheme.titleMedium?.copyWith(
            color: amountColor
          )
        ),
      ),
    );
  }
}