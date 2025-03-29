import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class TransactionsRepository{
  ResultFuture<List<Transaction>> getTransactions();
}