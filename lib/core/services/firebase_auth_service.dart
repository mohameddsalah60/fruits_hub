import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/errors_messages.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> signinUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(
          message: ErrorsMessages.getFirebaseErrorMessage(e.code));
    } catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      throw CustomException(
          message: ErrorsMessages.getFirebaseErrorMessage(e.code));
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future<User?> signinUserWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithGoogle e code: ${e.code}");
      if (e.code.contains('Null')) {
        throw CustomException(message: ErrorsMessages.cancellationMessage);
      }
      throw CustomException(
          message: ErrorsMessages.getFirebaseErrorMessage(e.code));
    } catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithGoogle: ${e.toString()}");

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken == null) {
        return null;
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      final credential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithFacebook e code: ${e.code}");
      if (e.code.contains('Null')) {
        throw CustomException(message: ErrorsMessages.cancellationMessage);
      }
      throw CustomException(
          message: ErrorsMessages.getFirebaseErrorMessage(e.code));
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithFacebook : ${e.toString()}");

      throw CustomException(message: ErrorsMessages.genericErrorMessage);
    }
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
