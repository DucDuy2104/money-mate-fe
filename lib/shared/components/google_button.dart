import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

// ignore: must_be_immutable
class GoogleSignInButton extends StatelessWidget {
  String content;
  VoidCallback onTap;

  GoogleSignInButton({super.key, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Image.asset('assets/images/google_logo.png', height: 24), 
        label: Text(
          content,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMd, horizontal: AppDimens.paddingMd),
          elevation: 2,
        ),
      ),
    );
  }
}


