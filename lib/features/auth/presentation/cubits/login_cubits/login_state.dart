part of 'login_cubit.dart';

class SignInState {}

final class LoginInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});
}

final class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});
}
