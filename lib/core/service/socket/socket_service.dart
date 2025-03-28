import 'package:flutter/material.dart';
import 'package:money_mate/core/config/api_config.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  final OnboardLocalDataSource _appStorage;

  SocketService(this._appStorage);

  Future<void> initSocket() async {
    String? token = _appStorage.getAccessToken();

    if (token == null) {
      throw Exception('Không tìm thấy token xác thực');
    }

    socket = IO.io(
        ApiConfig.socketBaseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setExtraHeaders({'Authorization': 'Bearer $token'})
            .setQuery({'token': token})
            .build());

    socket.connect();

    socket.onConnect((_) {
      debugPrint('Socket connection established');
    });

    socket.onConnectError((error) {
      debugPrint('Socket connection error: $error');
    });

    socket.onDisconnect((_) {
      debugPrint('Socket disconnected');
    });

    socket.onError((error) {
      debugPrint('Socket error: $error');
    });
  }

  void emit(String event, dynamic data) {
    socket.emit(event, data);
  }

  void listen(String event, Function(dynamic) callback) {
    socket.on(event, callback);
  }

  void disconnect() {
    socket.disconnect();
  }

  bool isConnected() {
    return socket.connected;
  }

  void reconnectWithNewToken() {
    String? token = _appStorage.getAccessToken();
    if (token != null) {
      socket.io.options?['extraHeaders'] = {'Authorization': 'Bearer $token'};
      socket.io.options?['query'] = {'token': token};
      socket.disconnect().connect();
    }
  }
}
