// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetChatDataImplCopyWith<$Res> {
  factory _$$GetChatDataImplCopyWith(
          _$GetChatDataImpl value, $Res Function(_$GetChatDataImpl) then) =
      __$$GetChatDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetChatDataImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$GetChatDataImpl>
    implements _$$GetChatDataImplCopyWith<$Res> {
  __$$GetChatDataImplCopyWithImpl(
      _$GetChatDataImpl _value, $Res Function(_$GetChatDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetChatDataImpl implements _GetChatData {
  const _$GetChatDataImpl();

  @override
  String toString() {
    return 'ChatEvent.getChatData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetChatDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return getChatData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return getChatData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (getChatData != null) {
      return getChatData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return getChatData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return getChatData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (getChatData != null) {
      return getChatData(this);
    }
    return orElse();
  }
}

abstract class _GetChatData implements ChatEvent {
  const factory _GetChatData() = _$GetChatDataImpl;
}

/// @nodoc
abstract class _$$ConnectImplCopyWith<$Res> {
  factory _$$ConnectImplCopyWith(
          _$ConnectImpl value, $Res Function(_$ConnectImpl) then) =
      __$$ConnectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ConnectImpl>
    implements _$$ConnectImplCopyWith<$Res> {
  __$$ConnectImplCopyWithImpl(
      _$ConnectImpl _value, $Res Function(_$ConnectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectImpl implements _Connect {
  const _$ConnectImpl();

  @override
  String toString() {
    return 'ChatEvent.connect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return connect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return connect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class _Connect implements ChatEvent {
  const factory _Connect() = _$ConnectImpl;
}

/// @nodoc
abstract class _$$UpdateMessagesImplCopyWith<$Res> {
  factory _$$UpdateMessagesImplCopyWith(_$UpdateMessagesImpl value,
          $Res Function(_$UpdateMessagesImpl) then) =
      __$$UpdateMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Message message});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$UpdateMessagesImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$UpdateMessagesImpl>
    implements _$$UpdateMessagesImplCopyWith<$Res> {
  __$$UpdateMessagesImplCopyWithImpl(
      _$UpdateMessagesImpl _value, $Res Function(_$UpdateMessagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UpdateMessagesImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$UpdateMessagesImpl implements _UpdateMessages {
  const _$UpdateMessagesImpl(this.message);

  @override
  final Message message;

  @override
  String toString() {
    return 'ChatEvent.updateMessages(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMessagesImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMessagesImplCopyWith<_$UpdateMessagesImpl> get copyWith =>
      __$$UpdateMessagesImplCopyWithImpl<_$UpdateMessagesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return updateMessages(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return updateMessages?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (updateMessages != null) {
      return updateMessages(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return updateMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return updateMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (updateMessages != null) {
      return updateMessages(this);
    }
    return orElse();
  }
}

abstract class _UpdateMessages implements ChatEvent {
  const factory _UpdateMessages(final Message message) = _$UpdateMessagesImpl;

  Message get message;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMessagesImplCopyWith<_$UpdateMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaveRoomImplCopyWith<$Res> {
  factory _$$LeaveRoomImplCopyWith(
          _$LeaveRoomImpl value, $Res Function(_$LeaveRoomImpl) then) =
      __$$LeaveRoomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LeaveRoomImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LeaveRoomImpl>
    implements _$$LeaveRoomImplCopyWith<$Res> {
  __$$LeaveRoomImplCopyWithImpl(
      _$LeaveRoomImpl _value, $Res Function(_$LeaveRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LeaveRoomImpl implements _LeaveRoom {
  const _$LeaveRoomImpl();

  @override
  String toString() {
    return 'ChatEvent.leaveRoom()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LeaveRoomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return leaveRoom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return leaveRoom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (leaveRoom != null) {
      return leaveRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return leaveRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return leaveRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (leaveRoom != null) {
      return leaveRoom(this);
    }
    return orElse();
  }
}

abstract class _LeaveRoom implements ChatEvent {
  const factory _LeaveRoom() = _$LeaveRoomImpl;
}

/// @nodoc
abstract class _$$CancelTransactionImplCopyWith<$Res> {
  factory _$$CancelTransactionImplCopyWith(_$CancelTransactionImpl value,
          $Res Function(_$CancelTransactionImpl) then) =
      __$$CancelTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Message message, BuildContext context, VoidCallback onSuccess});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$CancelTransactionImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$CancelTransactionImpl>
    implements _$$CancelTransactionImplCopyWith<$Res> {
  __$$CancelTransactionImplCopyWithImpl(_$CancelTransactionImpl _value,
      $Res Function(_$CancelTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? context = null,
    Object? onSuccess = null,
  }) {
    return _then(_$CancelTransactionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$CancelTransactionImpl implements _CancelTransaction {
  const _$CancelTransactionImpl(this.message, this.context, this.onSuccess);

  @override
  final Message message;
  @override
  final BuildContext context;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'ChatEvent.cancelTransaction(message: $message, context: $context, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelTransactionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, context, onSuccess);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelTransactionImplCopyWith<_$CancelTransactionImpl> get copyWith =>
      __$$CancelTransactionImplCopyWithImpl<_$CancelTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return cancelTransaction(message, context, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return cancelTransaction?.call(message, context, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (cancelTransaction != null) {
      return cancelTransaction(message, context, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return cancelTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return cancelTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (cancelTransaction != null) {
      return cancelTransaction(this);
    }
    return orElse();
  }
}

abstract class _CancelTransaction implements ChatEvent {
  const factory _CancelTransaction(
      final Message message,
      final BuildContext context,
      final VoidCallback onSuccess) = _$CancelTransactionImpl;

  Message get message;
  BuildContext get context;
  VoidCallback get onSuccess;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelTransactionImplCopyWith<_$CancelTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnableTransactionImplCopyWith<$Res> {
  factory _$$EnableTransactionImplCopyWith(_$EnableTransactionImpl value,
          $Res Function(_$EnableTransactionImpl) then) =
      __$$EnableTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Message message, BuildContext context, VoidCallback onSuccess});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$EnableTransactionImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EnableTransactionImpl>
    implements _$$EnableTransactionImplCopyWith<$Res> {
  __$$EnableTransactionImplCopyWithImpl(_$EnableTransactionImpl _value,
      $Res Function(_$EnableTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? context = null,
    Object? onSuccess = null,
  }) {
    return _then(_$EnableTransactionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$EnableTransactionImpl implements _EnableTransaction {
  const _$EnableTransactionImpl(this.message, this.context, this.onSuccess);

  @override
  final Message message;
  @override
  final BuildContext context;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'ChatEvent.enableTransaction(message: $message, context: $context, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnableTransactionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, context, onSuccess);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnableTransactionImplCopyWith<_$EnableTransactionImpl> get copyWith =>
      __$$EnableTransactionImplCopyWithImpl<_$EnableTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return enableTransaction(message, context, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return enableTransaction?.call(message, context, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (enableTransaction != null) {
      return enableTransaction(message, context, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return enableTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return enableTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (enableTransaction != null) {
      return enableTransaction(this);
    }
    return orElse();
  }
}

abstract class _EnableTransaction implements ChatEvent {
  const factory _EnableTransaction(
      final Message message,
      final BuildContext context,
      final VoidCallback onSuccess) = _$EnableTransactionImpl;

  Message get message;
  BuildContext get context;
  VoidCallback get onSuccess;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnableTransactionImplCopyWith<_$EnableTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMessageLoadingImplCopyWith<$Res> {
  factory _$$SetMessageLoadingImplCopyWith(_$SetMessageLoadingImpl value,
          $Res Function(_$SetMessageLoadingImpl) then) =
      __$$SetMessageLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, bool isLoading});
}

/// @nodoc
class __$$SetMessageLoadingImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SetMessageLoadingImpl>
    implements _$$SetMessageLoadingImplCopyWith<$Res> {
  __$$SetMessageLoadingImplCopyWithImpl(_$SetMessageLoadingImpl _value,
      $Res Function(_$SetMessageLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isLoading = null,
  }) {
    return _then(_$SetMessageLoadingImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetMessageLoadingImpl implements _SetMessageLoading {
  const _$SetMessageLoadingImpl(this.id, this.isLoading);

  @override
  final String id;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ChatEvent.setMessageLoading(id: $id, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMessageLoadingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isLoading);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMessageLoadingImplCopyWith<_$SetMessageLoadingImpl> get copyWith =>
      __$$SetMessageLoadingImplCopyWithImpl<_$SetMessageLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return setMessageLoading(id, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return setMessageLoading?.call(id, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (setMessageLoading != null) {
      return setMessageLoading(id, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return setMessageLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return setMessageLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (setMessageLoading != null) {
      return setMessageLoading(this);
    }
    return orElse();
  }
}

abstract class _SetMessageLoading implements ChatEvent {
  const factory _SetMessageLoading(final String id, final bool isLoading) =
      _$SetMessageLoadingImpl;

  String get id;
  bool get isLoading;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetMessageLoadingImplCopyWith<_$SetMessageLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMessageCancelImplCopyWith<$Res> {
  factory _$$SetMessageCancelImplCopyWith(_$SetMessageCancelImpl value,
          $Res Function(_$SetMessageCancelImpl) then) =
      __$$SetMessageCancelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$SetMessageCancelImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SetMessageCancelImpl>
    implements _$$SetMessageCancelImplCopyWith<$Res> {
  __$$SetMessageCancelImplCopyWithImpl(_$SetMessageCancelImpl _value,
      $Res Function(_$SetMessageCancelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SetMessageCancelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetMessageCancelImpl implements _SetMessageCancel {
  const _$SetMessageCancelImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ChatEvent.setMessageCancel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMessageCancelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMessageCancelImplCopyWith<_$SetMessageCancelImpl> get copyWith =>
      __$$SetMessageCancelImplCopyWithImpl<_$SetMessageCancelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return setMessageCancel(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return setMessageCancel?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (setMessageCancel != null) {
      return setMessageCancel(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return setMessageCancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return setMessageCancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (setMessageCancel != null) {
      return setMessageCancel(this);
    }
    return orElse();
  }
}

abstract class _SetMessageCancel implements ChatEvent {
  const factory _SetMessageCancel(final String id) = _$SetMessageCancelImpl;

  String get id;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetMessageCancelImplCopyWith<_$SetMessageCancelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMessageEnableImplCopyWith<$Res> {
  factory _$$SetMessageEnableImplCopyWith(_$SetMessageEnableImpl value,
          $Res Function(_$SetMessageEnableImpl) then) =
      __$$SetMessageEnableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$SetMessageEnableImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SetMessageEnableImpl>
    implements _$$SetMessageEnableImplCopyWith<$Res> {
  __$$SetMessageEnableImplCopyWithImpl(_$SetMessageEnableImpl _value,
      $Res Function(_$SetMessageEnableImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SetMessageEnableImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetMessageEnableImpl implements _SetMessageEnable {
  const _$SetMessageEnableImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ChatEvent.setMessageEnable(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMessageEnableImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMessageEnableImplCopyWith<_$SetMessageEnableImpl> get copyWith =>
      __$$SetMessageEnableImplCopyWithImpl<_$SetMessageEnableImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return setMessageEnable(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return setMessageEnable?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (setMessageEnable != null) {
      return setMessageEnable(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return setMessageEnable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return setMessageEnable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (setMessageEnable != null) {
      return setMessageEnable(this);
    }
    return orElse();
  }
}

abstract class _SetMessageEnable implements ChatEvent {
  const factory _SetMessageEnable(final String id) = _$SetMessageEnableImpl;

  String get id;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetMessageEnableImplCopyWith<_$SetMessageEnableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBotImplCopyWith<$Res> {
  factory _$$UpdateBotImplCopyWith(
          _$UpdateBotImpl value, $Res Function(_$UpdateBotImpl) then) =
      __$$UpdateBotImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, Bot bot});

  $BotCopyWith<$Res> get bot;
}

/// @nodoc
class __$$UpdateBotImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$UpdateBotImpl>
    implements _$$UpdateBotImplCopyWith<$Res> {
  __$$UpdateBotImplCopyWithImpl(
      _$UpdateBotImpl _value, $Res Function(_$UpdateBotImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? bot = null,
  }) {
    return _then(_$UpdateBotImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == bot
          ? _value.bot
          : bot // ignore: cast_nullable_to_non_nullable
              as Bot,
    ));
  }

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BotCopyWith<$Res> get bot {
    return $BotCopyWith<$Res>(_value.bot, (value) {
      return _then(_value.copyWith(bot: value));
    });
  }
}

/// @nodoc

class _$UpdateBotImpl implements _UpdateBot {
  const _$UpdateBotImpl(this.context, this.bot);

  @override
  final BuildContext context;
  @override
  final Bot bot;

  @override
  String toString() {
    return 'ChatEvent.updateBot(context: $context, bot: $bot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBotImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.bot, bot) || other.bot == bot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, bot);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBotImplCopyWith<_$UpdateBotImpl> get copyWith =>
      __$$UpdateBotImplCopyWithImpl<_$UpdateBotImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getChatData,
    required TResult Function() connect,
    required TResult Function(Message message) updateMessages,
    required TResult Function() leaveRoom,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        cancelTransaction,
    required TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)
        enableTransaction,
    required TResult Function(String id, bool isLoading) setMessageLoading,
    required TResult Function(String id) setMessageCancel,
    required TResult Function(String id) setMessageEnable,
    required TResult Function(BuildContext context, Bot bot) updateBot,
  }) {
    return updateBot(context, bot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getChatData,
    TResult? Function()? connect,
    TResult? Function(Message message)? updateMessages,
    TResult? Function()? leaveRoom,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult? Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult? Function(String id, bool isLoading)? setMessageLoading,
    TResult? Function(String id)? setMessageCancel,
    TResult? Function(String id)? setMessageEnable,
    TResult? Function(BuildContext context, Bot bot)? updateBot,
  }) {
    return updateBot?.call(context, bot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getChatData,
    TResult Function()? connect,
    TResult Function(Message message)? updateMessages,
    TResult Function()? leaveRoom,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        cancelTransaction,
    TResult Function(
            Message message, BuildContext context, VoidCallback onSuccess)?
        enableTransaction,
    TResult Function(String id, bool isLoading)? setMessageLoading,
    TResult Function(String id)? setMessageCancel,
    TResult Function(String id)? setMessageEnable,
    TResult Function(BuildContext context, Bot bot)? updateBot,
    required TResult orElse(),
  }) {
    if (updateBot != null) {
      return updateBot(context, bot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChatData value) getChatData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_UpdateMessages value) updateMessages,
    required TResult Function(_LeaveRoom value) leaveRoom,
    required TResult Function(_CancelTransaction value) cancelTransaction,
    required TResult Function(_EnableTransaction value) enableTransaction,
    required TResult Function(_SetMessageLoading value) setMessageLoading,
    required TResult Function(_SetMessageCancel value) setMessageCancel,
    required TResult Function(_SetMessageEnable value) setMessageEnable,
    required TResult Function(_UpdateBot value) updateBot,
  }) {
    return updateBot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetChatData value)? getChatData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_UpdateMessages value)? updateMessages,
    TResult? Function(_LeaveRoom value)? leaveRoom,
    TResult? Function(_CancelTransaction value)? cancelTransaction,
    TResult? Function(_EnableTransaction value)? enableTransaction,
    TResult? Function(_SetMessageLoading value)? setMessageLoading,
    TResult? Function(_SetMessageCancel value)? setMessageCancel,
    TResult? Function(_SetMessageEnable value)? setMessageEnable,
    TResult? Function(_UpdateBot value)? updateBot,
  }) {
    return updateBot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChatData value)? getChatData,
    TResult Function(_Connect value)? connect,
    TResult Function(_UpdateMessages value)? updateMessages,
    TResult Function(_LeaveRoom value)? leaveRoom,
    TResult Function(_CancelTransaction value)? cancelTransaction,
    TResult Function(_EnableTransaction value)? enableTransaction,
    TResult Function(_SetMessageLoading value)? setMessageLoading,
    TResult Function(_SetMessageCancel value)? setMessageCancel,
    TResult Function(_SetMessageEnable value)? setMessageEnable,
    TResult Function(_UpdateBot value)? updateBot,
    required TResult orElse(),
  }) {
    if (updateBot != null) {
      return updateBot(this);
    }
    return orElse();
  }
}

abstract class _UpdateBot implements ChatEvent {
  const factory _UpdateBot(final BuildContext context, final Bot bot) =
      _$UpdateBotImpl;

  BuildContext get context;
  Bot get bot;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBotImplCopyWith<_$UpdateBotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatLoadedData chatData) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatLoadedData chatData)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatLoadedData chatData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatLoadedData chatData) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatLoadedData chatData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatLoadedData chatData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChatState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatLoadedData chatData) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatLoadedData chatData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatLoadedData chatData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatLoadedData chatData});

  $ChatLoadedDataCopyWith<$Res> get chatData;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatData = null,
  }) {
    return _then(_$LoadedImpl(
      null == chatData
          ? _value.chatData
          : chatData // ignore: cast_nullable_to_non_nullable
              as ChatLoadedData,
    ));
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatLoadedDataCopyWith<$Res> get chatData {
    return $ChatLoadedDataCopyWith<$Res>(_value.chatData, (value) {
      return _then(_value.copyWith(chatData: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.chatData);

  @override
  final ChatLoadedData chatData;

  @override
  String toString() {
    return 'ChatState.loaded(chatData: $chatData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.chatData, chatData) ||
                other.chatData == chatData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatData);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatLoadedData chatData) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(chatData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatLoadedData chatData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(chatData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatLoadedData chatData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(chatData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ChatState {
  const factory _Loaded(final ChatLoadedData chatData) = _$LoadedImpl;

  ChatLoadedData get chatData;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ChatState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChatLoadedData chatData) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChatLoadedData chatData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChatLoadedData chatData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ChatState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatLoadedData {
  List<Message> get messages => throw _privateConstructorUsedError;
  Conversation get conversation => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ChatLoadedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatLoadedDataCopyWith<ChatLoadedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatLoadedDataCopyWith<$Res> {
  factory $ChatLoadedDataCopyWith(
          ChatLoadedData value, $Res Function(ChatLoadedData) then) =
      _$ChatLoadedDataCopyWithImpl<$Res, ChatLoadedData>;
  @useResult
  $Res call(
      {List<Message> messages, Conversation conversation, bool isLoading});

  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class _$ChatLoadedDataCopyWithImpl<$Res, $Val extends ChatLoadedData>
    implements $ChatLoadedDataCopyWith<$Res> {
  _$ChatLoadedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatLoadedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? conversation = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ChatLoadedData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationCopyWith<$Res> get conversation {
    return $ConversationCopyWith<$Res>(_value.conversation, (value) {
      return _then(_value.copyWith(conversation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatLoadedDataImplCopyWith<$Res>
    implements $ChatLoadedDataCopyWith<$Res> {
  factory _$$ChatLoadedDataImplCopyWith(_$ChatLoadedDataImpl value,
          $Res Function(_$ChatLoadedDataImpl) then) =
      __$$ChatLoadedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Message> messages, Conversation conversation, bool isLoading});

  @override
  $ConversationCopyWith<$Res> get conversation;
}

/// @nodoc
class __$$ChatLoadedDataImplCopyWithImpl<$Res>
    extends _$ChatLoadedDataCopyWithImpl<$Res, _$ChatLoadedDataImpl>
    implements _$$ChatLoadedDataImplCopyWith<$Res> {
  __$$ChatLoadedDataImplCopyWithImpl(
      _$ChatLoadedDataImpl _value, $Res Function(_$ChatLoadedDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatLoadedData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? conversation = null,
    Object? isLoading = null,
  }) {
    return _then(_$ChatLoadedDataImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as Conversation,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatLoadedDataImpl implements _ChatLoadedData {
  const _$ChatLoadedDataImpl(
      {required final List<Message> messages,
      required this.conversation,
      this.isLoading = false})
      : _messages = messages;

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final Conversation conversation;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ChatLoadedData(messages: $messages, conversation: $conversation, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatLoadedDataImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messages), conversation, isLoading);

  /// Create a copy of ChatLoadedData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatLoadedDataImplCopyWith<_$ChatLoadedDataImpl> get copyWith =>
      __$$ChatLoadedDataImplCopyWithImpl<_$ChatLoadedDataImpl>(
          this, _$identity);
}

abstract class _ChatLoadedData implements ChatLoadedData {
  const factory _ChatLoadedData(
      {required final List<Message> messages,
      required final Conversation conversation,
      final bool isLoading}) = _$ChatLoadedDataImpl;

  @override
  List<Message> get messages;
  @override
  Conversation get conversation;
  @override
  bool get isLoading;

  /// Create a copy of ChatLoadedData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatLoadedDataImplCopyWith<_$ChatLoadedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
