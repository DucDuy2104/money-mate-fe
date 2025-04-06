import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/bots_remote_data_source.dart';
import 'package:money_mate/data/models/bot_model.dart';
import 'package:money_mate/data/repositories/bots_repository.dart';
import 'package:money_mate/domain/entities/bot.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class BotsRepositoryImpl extends BotsRepository {
  final BotsRemoteDataSource _botsRemoteDataSource;
  BotsRepositoryImpl(this._botsRemoteDataSource);
  @override
  ResultFuture<Bot> updateBot(Bot bot) async {
    final result = await _botsRemoteDataSource.updateBot(bot);
    return result.fold(
        (failure) => Left(failure), (botModel) => Right(botModel.toEntity()));
  }
}
