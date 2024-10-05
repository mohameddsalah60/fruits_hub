import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/errors_messages.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(
        user: userEntity,
      );
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(
        ServerFailure(errMessage: ErrorsMessages.getErrorMessage(e)),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signinUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return left(
        ServerFailure(errMessage: ErrorsMessages.getErrorMessage(e)),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinUserWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signinUserWithGoogle();
      if (user == null) {
        return left(
            ServerFailure(errMessage: ErrorsMessages.cancellationMessage));
      }
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: 'users', docId: user.uid);
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await firebaseAuthService.deleteUser();
      return left(
        ServerFailure(errMessage: ErrorsMessages.getErrorMessage(e)),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinUserWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();

      if (user == null) {
        return left(
            ServerFailure(errMessage: ErrorsMessages.cancellationMessage));
      }
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: 'users', docId: user.uid);
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    } catch (e) {
      await firebaseAuthService.deleteUser();
      return left(ServerFailure(errMessage: ErrorsMessages.getErrorMessage(e)));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: 'users',
      data: user.toMap(),
      docId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await databaseService.getData(
      path: 'users',
      docId: uId,
    );
    return UserModel.fromJson(data);
  }
}
