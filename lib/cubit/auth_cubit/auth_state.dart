part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess(
    this.user,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSuccess && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'AuthSuccess(user: $user)';
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
