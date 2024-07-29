import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit(this.authRepo) : super(LoginInitial());
  Future<void> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SignInLoading());

    final result =
        await authRepo.loginUserWithEmailAndPassword(email, password);
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
