part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthVerifySuccess extends AuthState {
  final String token;

  const AuthVerifySuccess({required this.token});
}

final class AuthNewUser extends AuthState {}

final class AuthLoginOrRegister extends AuthState {
  final String message;

  const AuthLoginOrRegister({required this.message});
}

final class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}
