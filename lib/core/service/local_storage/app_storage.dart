import 'package:hive_flutter/hive_flutter.dart';

/// This class is used for storing, retrieving, and deleting data in Hive NoSQL boxes.
class AppStorage {
  final Box appBox;

  AppStorage(this.appBox);

  /// Retrieves a string value for a given key from the box.
  String? get({required String key}) {
    return appBox.get(key) as String?;
  }

  /// Retrieves a boolean value for a given key from the box.
  bool? getBool(String key) {
    return appBox.get(key) as bool?;
  }

  /// Stores a string value for the given key in the box.
  Future<void> put({
    required String key,
    required String value,
  }) async {
    await appBox.put(key, value);
  }

  /// Stores a boolean value for the given key in the box.
  Future<void> putBool({
    required String key,
    required bool value,
  }) async {
    await appBox.put(key, value);
  }

  /// Removes a specific key from the box.
  Future<void> remove(String key) async {
    await appBox.delete(key);
  }

  /// Removes accessToken and refreshToken from the box (logout).
  Future<void> logout() async {
    await clearAllData();
  }

  /// Clears all data in the box.
  Future<void> clearAllData() async {
    await appBox.clear();
  }
}
