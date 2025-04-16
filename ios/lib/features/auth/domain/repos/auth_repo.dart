import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failures, UserEntity>> signinUserWithEmailAndPassword(
      String email, String password);
  Future<Either<Failures, UserEntity>> signinUserWithGoogle();
  Future<Either<Failures, UserEntity>> signinUserWithFacebook();
  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
}
