import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/category.dart';

part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    required String id,
    required Category category,
    required double amount,
    required String description,
    required DateTime createdAt
  }) = _Transaction;
}