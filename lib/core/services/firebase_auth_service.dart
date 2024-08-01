import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'البريد الالكتروانى او الرقم السري خطأ.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد الالكتروانى او الرقم السري خطأ.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'يرجي ادخال ايميل صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'يرجي ادخال ايميل صحيح.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
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
        throw CustomException(message: 'تم إلغاء عملية تسجيل الدخول.');
      }
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    } catch (e) {
      log("Exception in FirebaseAuthService.signinUserWithGoogle: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
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
        throw CustomException(message: 'تم إلغاء عملية تسجيل الدخول.');
      }
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithFacebook : ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
