import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GoogleSignInButton extends StatelessWidget {
  String content;

  GoogleSignInButton({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          //TODO: handle login with Google
        },
        icon: Image.asset('assets/images/google_logo.png', height: 24), 
        label: Text(
          content,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          elevation: 2,
        ),
      ),
    );
  }
}


