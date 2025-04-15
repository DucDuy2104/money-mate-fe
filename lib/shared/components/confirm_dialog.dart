import 'package:flutter/material.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

/// A customizable confirmation dialog.
///
/// This dialog is used to confirm user actions with custom title, message,
/// button labels, and optional icon.
class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmLabel;
  final String? cancelLabel;
  final IconData? icon;
  final Color? iconColor;
  final bool showCancelButton;
  final bool isDestructiveAction;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel,
    this.cancelLabel,
    this.icon,
    this.iconColor,
    this.showCancelButton = true,
    this.isDestructiveAction = false,
    this.onConfirm,
    this.onCancel,
  });

  /// Helper method to show the dialog.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmLabel,
    String? cancelLabel,
    IconData? icon,
    Color? iconColor,
    bool showCancelButton = true,
    bool isDestructiveAction = false,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        icon: icon,
        iconColor: iconColor,
        showCancelButton: showCancelButton,
        isDestructiveAction: isDestructiveAction,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colors = AppColors.colorsData(context);
    
    // Determine the colors based on whether this is a destructive action
    final Color actionColor = isDestructiveAction 
        ? Colors.red 
        : AppColors.primaryColor;
    
    return Dialog(
      backgroundColor: colors.dialogColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingLg, 
              vertical: AppDimens.paddingMd,
            ),
            color: isDestructiveAction ? Colors.red : AppColors.primaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: context.textTheme.titleLarge,
                  ),
                ),
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
              ],
            ),
          ),
          
          // Message
          Padding(
            padding: const EdgeInsets.all(AppDimens.paddingLg),
            child: Text(
              message,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(AppDimens.paddingMd),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showCancelButton) ...[
                  TextButton(
                    onPressed: () {
                      if (onCancel != null) {
                        onCancel!();
                      }
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      cancelLabel ?? s.cancel,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  AppDimens.spaceSm,
                ],
                ElevatedButton(
                  onPressed: () {
                    if (onConfirm != null) {
                      onConfirm!();
                    }
                    Navigator.of(context).pop(true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actionColor,
                  ),
                  child: Text(
                    confirmLabel ?? (isDestructiveAction ? s.delete : s.confirm),
                    style: context.textTheme.bodyMedium
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
