import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/invoice_item.dart';
import 'package:money_mate/presentation/pages/chat/cubit/selected_invoices_cubit.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class InvoiceItemUI extends StatelessWidget {
  final InvoiceItem item;
  final VoidCallback onSelectChanged;

  const InvoiceItemUI({
    super.key,
    required this.item,
    required this.onSelectChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedInvoicesCubit, Set<InvoiceItem>>(
      builder: (context, state) {
        final isSelected = state.contains(item);
        return InkWell(
          onTap: onSelectChanged,
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(AppDimens.radiusMd),
              border: isSelected
                  ? Border.all(color: item.enumValue.color, width: 1.5)
                  : null,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingMd, vertical: AppDimens.paddingSm),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(AppDimens.paddingSm),
                  decoration: BoxDecoration(
                    color: item.enumValue.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                  ),
                  child: Icon(
                    item.enumValue.icon,
                    color: item.enumValue.color,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Quantity and unit
                      Text(
                        '${formatNumber(item.quantity)} x ${item.unit}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      AppDimens.divider,

                      // Total price (moved down)
                      Text(
                        CurrencyHelper.formatCurrency(item.total),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.teal[700],
                        ),
                      ),
                    ],
                  ),
                ),

                // Checkbox
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: isSelected ? item.enumValue.color : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color:
                          isSelected ? item.enumValue.color : Colors.grey[400]!,
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String formatNumber(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(2);
  }
}
