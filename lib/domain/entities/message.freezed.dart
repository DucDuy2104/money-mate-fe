// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get conversation => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isSentByMe => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String id,
      String user,
      String conversation,
      Transaction? transaction,
      MessageType type,
      String content,
      bool isSentByMe,
      DateTime createdAt});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? conversation = null,
    Object? transaction = freezed,
    Object? type = null,
    Object? content = null,
    Object? isSentByMe = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isSentByMe: null == isSentByMe
          ? _value.isSentByMe
          : isSentByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String user,
      String conversation,
      Transaction? transaction,
      MessageType type,
      String content,
      bool isSentByMe,
      DateTime createdAt});

  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? conversation = null,
    Object? transaction = freezed,
    Object? type = null,
    Object? content = null,
    Object? isSentByMe = null,
    Object? createdAt = null,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isSentByMe: null == isSentByMe
          ? _value.isSentByMe
          : isSentByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {required this.id,
      required this.user,
      required this.conversation,
      required this.transaction,
      required this.type,
      required this.content,
      required this.isSentByMe,
      required this.createdAt});

  @override
  final String id;
  @override
  final String user;
  @override
  final String conversation;
  @override
  final Transaction? transaction;
  @override
  final MessageType type;
  @override
  final String content;
  @override
  final bool isSentByMe;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Message(id: $id, user: $user, conversation: $conversation, transaction: $transaction, type: $type, content: $content, isSentByMe: $isSentByMe, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isSentByMe, isSentByMe) ||
                other.isSentByMe == isSentByMe) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, user, conversation,
      transaction, type, content, isSentByMe, createdAt);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String id,
      required final String user,
      required final String conversation,
      required final Transaction? transaction,
      required final MessageType type,
      required final String content,
      required final bool isSentByMe,
      required final DateTime createdAt}) = _$MessageImpl;

  @override
  String get id;
  @override
  String get user;
  @override
  String get conversation;
  @override
  Transaction? get transaction;
  @override
  MessageType get type;
  @override
  String get content;
  @override
  bool get isSentByMe;
  @override
  DateTime get createdAt;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
