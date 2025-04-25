import 'dart:io';

import 'package:photo_manager/photo_manager.dart';

extension AssetEntityExt on AssetEntity {
  Future<File?> toFile() => file;
}
