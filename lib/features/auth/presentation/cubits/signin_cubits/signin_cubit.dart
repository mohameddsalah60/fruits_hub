import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit(this.authRepo) : super(SignInInitial());
  Future<void> signinUserWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SignInLoading());

    final result =
        await authRepo.signinUserWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(SignInFailure(message: failure.errMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future<void> signinUserWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signinUserWithGoogle();
    result.fold(
      (failure) {
        emit(SignInFailure(message: failure.errMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future<void> signinUserWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepo.signinUserWithFacebook();
    result.fold(
      (failure) {
        emit(SignInFailure(message: failure.errMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }
}
