import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/enums/message_type.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String user,
    required String conversation,
    required Transaction? transaction,
    required Category? category,
    required MessageType type,
    required String? content,
    required List<String> assets,
    required bool isSentByMe,
    required DateTime createdAt,
  }) = _Message;
}
