import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/extensions/datetime_ext.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    required String id,
    required CategoryModel category,
    required double amount,
    required String description,
    required DateTime createdAt,
    required bool isCancel
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

extension TransactionModelX on TransactionModel {
  Transaction toEntity() {
    return Transaction(
        id: id,
        category: category.toEntity(),
        amount: amount,
        description: description,
        isCancel: isCancel,
        createdAt: createdAt.toUtcPlus7());
  }
}
