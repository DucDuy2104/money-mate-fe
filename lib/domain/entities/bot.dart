import 'package:freezed_annotation/freezed_annotation.dart';

part 'bot.freezed.dart';

@freezed
class Bot with _$Bot {
  const factory Bot({
    required String id,
    required String name,
    required String description,
  }) = _Bot;
}

extension BotX on Bot {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}
