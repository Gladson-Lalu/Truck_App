import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_model.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/firestore_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final SharedPreferences _prefs;
  final FireStoreService _fireStoreService;
  AuthCubit(this._authService, this._fireStoreService,
      this._prefs)
      : super(const AuthInitial());

  Future<void> signIn(String email, String password) async {
    emit(const AuthLoading());
    try {
      await _authService.signIn(email, password).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('The operation has timed out.');
        },
      );
      final UserModel _userModel =
          await _fireStoreService.getUserDetails().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('The operation has timed out.');
        },
      );
      _saveUserDetails(email, password);
      emit(AuthSuccess(_userModel));
    } catch (e) {
      emit(AuthFailure(
          e.toString().split('Exception: ')[1]));
    }
  }

  Future<void> signUp(
      String email,
      String password,
      String name,
      String phoneNumber,
      String address,
      String userType) async {
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
      final UserModel _userModel = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        userType: userType,
      );
      await _fireStoreService.createUser(_userModel);
      _saveUserDetails(email, password);
      emit(AuthSuccess(_userModel));
    } catch (e) {
      emit(AuthFailure(
          e.toString().split('Exception: ')[1]));
    }
  }

  Future<void> signOut() async {
    emit(const AuthLoading());
    try {
      await _authService.signOut();
      _prefs.remove('email');
      _prefs.remove('password');
      emit(const AuthInitial());
    } catch (e) {
      emit(AuthFailure(
          e.toString().split('Exception: ')[1]));
    }
  }

  Future<void> checkIfUserIsLoggedIn() async {
    final String? email = _prefs.getString('email');
    final String? password = _prefs.getString('password');

    if (email != null && password != null) {
      emit(const AuthLoading());
      try {
        await _authService.signIn(email, password);
        final UserModel _userModel =
            await _fireStoreService.getUserDetails();
        emit(AuthSuccess(_userModel));
      } catch (e) {
        emit(AuthFailure(
            e.toString().split('Exception: ')[1]));
      }
    }
  }

  Future<void> _saveUserDetails(
      String email, String password) async {
    await _prefs.setString('email', email);
    await _prefs.setString('password', password);
  }
}
