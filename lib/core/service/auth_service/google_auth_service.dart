import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_mate/core/service/auth_service/auth_user_result.dart';
import 'package:money_mate/firebase_options.dart';

class GoogleAuthService {
  static Future<AuthUserResult> signInWithGoogle() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              serverClientId:
                  "560780120050-mm1bbikv85pbkd4q4sbfqs34q4b1jig7.apps.googleusercontent.com")
          .signIn();
      debugPrint(
          'Successfully signed in with Google USER: ${googleUser.toString()}');
      if (googleUser == null) {
        throw Exception('Google Sign-In canceled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if (user == null) throw Exception('Firebase user is null');

      final String? firebaseIdToken = await user.getIdToken();

      log('Firebase ID Token: $firebaseIdToken');
      return AuthUserResult(
        firebaseIdToken: firebaseIdToken,
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
        email: user.email,
        avatar: user.photoURL,
        displayName: user.displayName,
      );
    } catch (e) {
      debugPrint('Login error: $e');
      rethrow;
    }
  }
}
