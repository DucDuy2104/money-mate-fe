import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/bot.dart';

part 'bot_model.freezed.dart';
part 'bot_model.g.dart';

@freezed
class BotModel with _$BotModel {
  const factory BotModel({
    required String id,
    required String name,
    required String description,
  }) = _BotModel;

  factory BotModel.fromJson(Map<String, dynamic> json) => _$BotModelFromJson(json);
}

extension BotModelX on BotModel  {
  Bot toEntity() {
    return Bot(
      id: id,
      name: name,
      description: description,
    );
  }
}
