import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:money_mate/shared/constants/app_constants.dart';

class UploadHelper {
  var cloudinary = Cloudinary.fromStringUrl(
      'cloudinary://${AppConstants.apiKey}:${AppConstants.apiSecret}@${AppConstants.cloudName}');
  UploadHelper() {
    cloudinary.config.urlConfig.secure = true;
  }

  Future<String> uploadFile(File file) async {
    try {
      final response = await cloudinary.uploader().upload(file);
      if (response == null || response.data?.url == null) {
        throw Exception(
            response?.error?.message ?? 'Unknown error during upload');
      }
      return response.data!.url!;
    } catch (e, s) {
      log('Upload failed: $e\n$s');
      rethrow;
    }
  }
}
