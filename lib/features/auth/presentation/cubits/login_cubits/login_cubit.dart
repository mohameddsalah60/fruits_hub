import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  Future<void> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoginLoading());

    final result =
        await authRepo.loginUserWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(LoginFailure(message: failure.errMessage));
      },
      (user) {
        emit(LoginSuccess(userEntity: user));
      },
    );
  }
}
