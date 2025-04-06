import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
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
    final formattedDate = TimeHelper.formatCustomDateTime(transaction.createdAt);
    final formattedAmount = CurrencyHelper.formatCurrency(transaction.amount);

    final Color amountColor = transaction.category.type == CategoriesType.income
        ? AppColors.upColor
        : AppColors.downColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D3A),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              // Leading icon
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: transaction.category.color.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: transaction.category.color.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  transaction.category.icon,
                  color: transaction.category.color,
                  size: AppDimens.iconSize,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.category.name,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (transaction.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          transaction.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              AppDimens.spaceSmall,
              
              // Amount and time
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formattedDate,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: AppColors.subText.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.category.type == CategoriesType.income 
                        ? "+$formattedAmount" 
                        : "-$formattedAmount",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: amountColor,
                      fontWeight: FontWeight.w700,
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}