import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';
import 'package:money_mate/shared/enums/message_type.dart';

class SwitchCategoryItem extends StatelessWidget {
  final Category category;
  final MessageType type;
  final Function()? onTap;

  const SwitchCategoryItem({
    super.key,
    required this.category,
    required this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color typeColor = category.type == CategoriesType.income
        ? AppColors.upColor
        : AppColors.downColor;

    final String typeText =
        category.type == CategoriesType.income ? "Thu nhập" : "Chi tiêu";

    final width = MediaQuery.of(context).size.width * 0.7;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: category.color.withOpacity(0.2),
                  child: Icon(
                    category.icon,
                    color: category.color,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: context.textTheme.titleMedium?.copyWith(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        typeText,
                        style: context.textTheme.bodySmall?.copyWith(color: typeColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: type == MessageType.add
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  child: Icon(
                    type == MessageType.add ? Icons.check : Icons.close,
                    color: type == MessageType.add ? Colors.green : Colors.red,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}