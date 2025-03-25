import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/shared/enums/transaction_types.dart';

part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String title,
    required String description,
    required double amount,
    required DateTime date,
    required TransactionTypes type,
  }) = _Transaction;
}
