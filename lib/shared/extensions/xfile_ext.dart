import 'dart:io';
import 'package:image_picker/image_picker.dart';

extension XFileExt on XFile {
  File toFile() => File(path);
}
