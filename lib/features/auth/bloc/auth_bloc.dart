import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/helper/secure_storage.dart';
import 'package:skilltest/features/auth/repository/auth_remote_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthVerifyEvent>(_authVerifyEvent);
    on<AuthLoginOrRegisterEvent>(_authLoginOrRegisterEvent);
  }

  FutureOr<void> _authVerifyEvent(
    AuthVerifyEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await AuthRemoteRepository.verifyUser(
        phoneNumber: event.phoneNumber,
      );

      if (response["user"] == true) {
        final token = response["token"]["access"];
        await SecureStorageHelper.write(key: "jwt_token", value: token);
        emit(AuthVerifySuccess(token: token));
      } else {
        emit(AuthNewUser());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  FutureOr<void> _authLoginOrRegisterEvent(
    AuthLoginOrRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await AuthRemoteRepository.loginOrRegister(
        phoneNumber: event.phoneNumber,
        firstName: event.firstName,
      );

      final token = response["token"]["access"];
      final message = response["message"];
      await SecureStorageHelper.write(key: "jwt_token", value: token);

      emit(AuthLoginOrRegister(message: message));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
