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
      child: Card(
        elevation: 2,
        color: Colors.grey[200],
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: category.color.withOpacity(0.2),
            child: Icon(
              category.icon,
              color: category.color,
            ),
          ),
          title: Text(
            category.name,
            style: context.textTheme.titleMedium?.copyWith(color: Colors.black),
          ),
          subtitle: Text(
            typeText,
            style: context.textTheme.bodySmall?.copyWith(color: typeColor),
          ),
          trailing: CircleAvatar(
            backgroundColor: type == MessageType.add
                ? Colors.green.withOpacity(0.2)
                : Colors.red.withOpacity(0.2),
            child: Icon(
              type == MessageType.add ? Icons.check : Icons.close,
              color: type == MessageType.add ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
