import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';

class SuggestCategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;
  final VoidCallback? onApprove;

  const SuggestCategoryItem({
    super.key,
    required this.category,
    this.onTap,
    this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = category.type == CategoriesType.income;
    final typeColor = isIncome ? AppColors.upColor : AppColors.downColor;
    final typeText = isIncome ? "Thu nhập" : "Chi tiêu";

    final isEnable =
        BlocProvider.of<CategoriesBloc>(context).checkCategory(category.id);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        elevation: 2,
        color: Colors.grey[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: onTap,
              leading: CircleAvatar(
                backgroundColor: category.color.withOpacity(0.2),
                child: Icon(category.icon, color: category.color),
              ),
              title: Text(category.name,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: Colors.black)),
              subtitle: Text(
                typeText,
                style: context.textTheme.bodySmall?.copyWith(color: typeColor),
              ),
              trailing: ElevatedButton(
                onPressed: isEnable ? onApprove : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: category.color,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(60, 36),
                ),
                child: const Text("Thêm"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
