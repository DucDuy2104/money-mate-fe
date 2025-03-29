import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class TransactionInfoMessage extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onCancel;

  const TransactionInfoMessage({
    super.key,
    required this.transaction,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 0.5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: transaction.category.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  transaction.category.icon,
                  color: transaction.category.color,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.category.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          transaction.category.type.name,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '• ${_formatDate(transaction.createdAt)} ${_formatTime(transaction.createdAt)}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onCancel,
                child: Icon(
                  Icons.close,
                  color: Colors.grey[600],
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: transaction.amount >= 0
                        ? Colors.teal[50]
                        : Colors.red[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    CurrencyHelper.formatCurrencyCompact(transaction.amount),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: transaction.amount >= 0
                          ? Colors.teal[800]
                          : Colors.red[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (transaction.description.isNotEmpty) ...[
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      transaction.description,
                      style: TextStyle(
                        fontSize: 12,
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

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
