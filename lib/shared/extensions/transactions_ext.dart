import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/utils/datetime_utils.dart';

extension TransactionsExt on List<Transaction> {
  List<Transaction> toFilterTransactionCreatedAt() {
    DateTime? time;
    return map((transaction) {
      if (time == null) {
        time = transaction.createdAt;
        return transaction.copyWith(isShowTime: true);
      }
      if (DatetimeUtils.isSameDate(time!, transaction.createdAt)) {
        return transaction;
      } else {
        time = transaction.createdAt;
        return transaction.copyWith(isShowTime: true);
      }
    }).toList();
  }
}
