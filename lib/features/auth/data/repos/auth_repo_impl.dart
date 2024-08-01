import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return left(
        ServerFailure(errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signinUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return left(
        ServerFailure(errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinUserWithGoogle() async {
    try {
      var user = await firebaseAuthService.signinUserWithGoogle();
      if (user == null) {
        return left(ServerFailure(errMessage: 'تم إلغاء عملية تسجيل الدخول.'));
      }
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return left(
        ServerFailure(errMessage: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinUserWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();

      if (user == null) {
        return left(ServerFailure(errMessage: 'user == null'));
      }

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    } catch (e) {
      return left(
          ServerFailure(errMessage: 'لقد حدث خطأ. الرجاء المحاولة مرة أخرى.'));
    }
  }
}
