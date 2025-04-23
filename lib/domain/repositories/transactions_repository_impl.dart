import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/transactions_remote_data_source.dart';
import 'package:money_mate/data/models/transaction_model.dart';
import 'package:money_mate/data/repositories/transactions_repository.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final TransactionsRemoteDataSource _remoteDataSource;
  TransactionsRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<List<Transaction>> getTransactions({String? lastTransactionId}) async {
    final result = await _remoteDataSource.getTransactions(lastTransactionId: lastTransactionId);
    return result.fold(
        (failure) => Left(failure),
        (transactionModels) =>
            Right(transactionModels.map((e) => e.toEntity()).toList()));
  }

  @override
  ResultFuture<Transaction> enableTransaction(String id) async {
    final result = await _remoteDataSource.enableTransaction(id);
    return result.fold((failure) => Left(failure),
        (transactionModel) => Right(transactionModel.toEntity()));
  }

  @override
  ResultFuture<Transaction> cancelTransaction(String id) async {
    final result = await _remoteDataSource.cancelTransaction(id);
    return result.fold((failure) => Left(failure),
        (transactionModel) => Right(transactionModel.toEntity()));
  }
}
