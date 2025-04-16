// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/routes/go_router.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/confirm_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> _checkPermission({
    required Permission permission,
    bool showAlerts = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;
    final s = S.of(context);

    final status = await permission.status;

    if (status.isGranted) {
      return true;
    }

    if (!status.isPermanentlyDenied) {
      final result = await permission.request();
      if (result.isGranted) {
        return true;
      }
    }

    if (showAlerts) {
      final content = switch (permission) {
        Permission.camera => s.cameraPermissionMessage,
        Permission.photos => s.photosPermissionMessage,
        Permission.notification => s.notificationPermissionMessage,
        _ => s.genericPermissionMessage,
      };

      final confirmed = await ConfirmDialog.show(
        context: context,
        title: s.enableAccessTitle,
        message: content,
        confirmLabel: s.settingsButton,
        cancelLabel: s.cancelButton,
        onConfirm: () async {
          try {
            await AppSettings.openAppSettings();
          } catch (e) {
            _showErrorToast(s.errorOpenSettings);
          }
        },
      );

      if (confirmed == true) {
        return false;
      }
    }

    return false;
  }

  static void _showErrorToast(String message) {
    final context = rootNavigatorKey.currentContext!;
    AppToast.error(context, message);
  }

  static Future<bool> checkCameraPermission(bool showAlerts) {
    return _checkPermission(
      permission: Permission.camera,
      showAlerts: showAlerts,
    );
  }

  static Future<bool> checkPhotosPermission(bool showAlerts) async {
    if (Platform.isIOS) {
      return true;
    }

    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final permission = Platform.isAndroid
        ? androidInfo.version.sdkInt <= 32
            ? Permission.storage
            : Permission.photos
        : Permission.mediaLibrary;

    return _checkPermission(
      permission: permission,
      showAlerts: showAlerts,
    );
  }

  static Future<bool> checkNotificationPermission(bool showAlerts) {
    return _checkPermission(
      permission: Permission.notification,
      showAlerts: showAlerts,
    );
  }

  static Future<bool> checkLocationPermission(bool showAlerts) async {
    final context = rootNavigatorKey.currentContext!;
    final s = S.of(context);
    final granted = await Permission.location.isGranted;

    if (granted) return true;

    var proceed = true;
    if (showAlerts) {
      final result = await ConfirmDialog.show(
        context: context,
        title: s.locationPermissionTitle,
        message: 'TODO - show description',
        confirmLabel: s.okButton,
        cancelLabel: s.cancelButton,
      );
      proceed = result == true;
    }

    if (!proceed) return false;

    if (Platform.isIOS) {
      return _checkLocationPermissionIOS(showAlerts);
    }

    return _checkPermission(
      permission: Permission.location,
      showAlerts: showAlerts,
    );
  }

  static Future<bool> _checkLocationPermissionIOS(bool showAlerts) async {
    final context = rootNavigatorKey.currentContext!;
    final s = S.of(context);

    var permissionStatus = await Permission.location.status;
    if (!permissionStatus.isGranted) {
      var status = await Permission.location.request();
      if (!status.isGranted && showAlerts) {
        await ConfirmDialog.show(
          context: context,
          title: s.permissionDeniedTitle,
          message: s.locationPermissionMessageIos,
          confirmLabel: s.settingsButton,
          showCancelButton: false,
          onConfirm: () async {
            try {
              await AppSettings.openAppSettings();
            } catch (e) {
              _showErrorToast(s.errorOpenSettings);
            }
          },
        );
        return false;
      }
    }

    return true;
  }

  static Future<bool> checkMicrophonePermission(bool showAlerts) {
    return _checkPermission(
      permission: Permission.microphone,
      showAlerts: showAlerts,
    );
  }
}
