enum MessageType {
  text,
  transaction;

  static MessageType fromString(String value) {
    return MessageType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw ArgumentError('Invalid MessageType: $value'),
    );
  }
}
