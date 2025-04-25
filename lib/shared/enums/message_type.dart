enum MessageType {
  text,
  add,
  delete,
  image,
  recommend,
  invoice,
  error,
  transaction;

  static MessageType fromString(String value) {
    return MessageType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw ArgumentError('Invalid MessageType: $value'),
    );
  }
}
