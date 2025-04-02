import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/transaction_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class TransactionsRemoteDataSource {
  ResultFuture<List<TransactionModel>> getTransactions();
  ResultFuture<TransactionModel> enableTransaction(String id);
  ResultFuture<TransactionModel> cancelTransaction(String id);
}

class TransactionsRemoteDataSourceImpl extends TransactionsRemoteDataSource {
  final ApiClient _client;
  TransactionsRemoteDataSourceImpl(this._client);
  @override
  ResultFuture<List<TransactionModel>> getTransactions() {
    final req = ApiRequest(url: '/transactions');
    return _client.get(
        req: req,
        parser: (data) =>
            (data as List).map((e) => TransactionModel.fromJson(e)).toList());
  }

  @override
  ResultFuture<TransactionModel> cancelTransaction(String id) {
    final req = ApiRequest(url: '/transactions/cancel', body: {
      "id": id,
    });
    return _client.patch(
        req: req, parser: (data) => TransactionModel.fromJson(data));
  }

  @override
  ResultFuture<TransactionModel> enableTransaction(String id) {
    final req = ApiRequest(url: '/transactions/enable', body: {
      "id": id,
    });
    return _client.patch(
        req: req, parser: (data) => TransactionModel.fromJson(data));
  }
}
