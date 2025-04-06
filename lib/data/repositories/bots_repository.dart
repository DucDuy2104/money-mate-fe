import 'package:money_mate/domain/entities/bot.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class BotsRepository {
  ResultFuture<Bot> updateBot(Bot bot);
}