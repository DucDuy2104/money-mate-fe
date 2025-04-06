import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class ScreenUtils {
  static EdgeInsets screenPaddingWithSafeArea(BuildContext context) {
  final padding = MediaQuery.of(context).padding;
  return EdgeInsets.only(
    top: padding.top,
    bottom: padding.bottom,
    left: AppDimens.paddingSmall,
    right: AppDimens.paddingSmall,
  );
}
}