import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  AuthCubit(this._authService) : super(const AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(const AuthLoading());
    try {
      final User user = await _authService
          .signIn(email, password)
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('The operation has timed out.');
        },
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(
          e.toString().split('Exception: ')[1]));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(const AuthLoading());
    try {
      final User user = await _authService
          .signUp(email, password)
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('The operation has timed out.');
        },
      );
      emit(AuthSuccess(user));
    } on Exception catch (e) {
      emit(AuthFailure(
          e.toString().split('Exception: ')[1]));
    }
  }
}
