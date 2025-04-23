import 'package:image_picker/image_picker.dart';
import 'package:money_mate/shared/helper/permission_helper.dart';

class GalleryHelper {
  static final _picker = ImagePicker();

  // Pick image
  static Future<XFile?> pickImageFromGallery(
      {bool showPermissionAlert = true}) async {
    final hasPermission =
        await PermissionHelper.checkPhotosPermission(showPermissionAlert);

    if (!hasPermission) return null;

    try {
      return await _picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      return null;
    }
  }

  // Pick images
  static Future<List<XFile>> pickMultipleImagesFromGallery(
      {bool showPermissionAlert = true}) async {
    final hasPermission =
        await PermissionHelper.checkPhotosPermission(showPermissionAlert);

    if (!hasPermission) return [];

    try {
      return await _picker.pickMultiImage();
    } catch (e) {
      return [];
    }
  }

  // Take a photo
  static Future<XFile?> pickImageFromCamera(
      {bool showPermissionAlert = true}) async {
    final hasPermission =
        await PermissionHelper.checkCameraPermission(showPermissionAlert);

    if (!hasPermission) return null;

    try {
      return await _picker.pickImage(source: ImageSource.camera);
    } catch (e) {
      return null;
    }
  }
}
