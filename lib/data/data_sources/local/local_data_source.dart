import 'package:money_mate/core/service/local_storage/app_storage.dart';

abstract class OnboardLocalDataSource {
  bool isFirstTime();
  Future<void> saveFirstTime();
  Future<void> saveEulaAccepted();
  bool isEulaAccepted();
  Future<void> setAuthenticated();
  bool isAuthenticated();

  /// Save and retrieve authentication tokens
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  String? getAccessToken();
  String? getRefreshToken();

  /// Logout - Remove stored tokens
  Future<void> logout();
}

class OnboardLocalDataSourceImpl implements OnboardLocalDataSource {
  final AppStorage _appStorage;

  OnboardLocalDataSourceImpl(this._appStorage);

  @override
  bool isFirstTime() {
    return _appStorage.getBool('isFirstTime') ?? true;
  }

  @override
  Future<void> saveFirstTime() async {
    await _appStorage.putBool(key: 'isFirstTime', value: false);
  }

  @override
  Future<void> saveEulaAccepted() async {
    await _appStorage.putBool(key: 'eulaAccepted', value: true);
  }

  @override
  bool isEulaAccepted() {
    return _appStorage.getBool('eulaAccepted') ?? false;
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await _appStorage.put(key: 'accessToken', value: token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _appStorage.put(key: 'refreshToken', value: token);
  }

  @override
  String? getAccessToken() {
    return _appStorage.get(key: 'accessToken');
  }

  @override
  String? getRefreshToken() {
    return _appStorage.get(key: 'refreshToken');
  }

  @override
  Future<void> logout() async {
    await _appStorage.logout();
  }

  @override
  bool isAuthenticated() {
    return _appStorage.getBool('isAuthenticated') ?? false;
  }

  @override
  Future<void> setAuthenticated() async {
    await _appStorage.putBool(key: 'isAuthenticated', value: true);
  }
}
