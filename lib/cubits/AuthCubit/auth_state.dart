part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSignInSuccess extends AuthState {
  final UserModel user;
  AuthSignInSuccess({required this.user});
}

final class AuthSignUpSuccess extends AuthState {
  final UserModel user;
  AuthSignUpSuccess({required this.user});
}

final class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}
