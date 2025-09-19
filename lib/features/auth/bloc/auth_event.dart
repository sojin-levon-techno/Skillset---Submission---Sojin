part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthVerifyEvent extends AuthEvent {
  final String phoneNumber;

  const AuthVerifyEvent({required this.phoneNumber});
}

final class AuthLoginOrRegisterEvent extends AuthEvent {
  final String phoneNumber;
  final String firstName;

  const AuthLoginOrRegisterEvent({
    required this.phoneNumber,
    required this.firstName,
  });
}
