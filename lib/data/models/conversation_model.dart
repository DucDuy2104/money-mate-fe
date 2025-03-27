import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/conversation.dart';
import 'bot_model.dart'; 

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required String id,
    required BotModel bot,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);
}

extension ConversationModelX on ConversationModel {
  Conversation toEntity() {
    return Conversation(
      id: id,
      bot: bot.toEntity(),
      type: type,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
