import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/bot.dart';

part 'conversation.freezed.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required Bot bot,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Conversation;
}
