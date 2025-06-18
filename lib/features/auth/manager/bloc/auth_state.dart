import 'package:equatable/equatable.dart';
import 'package:nawel/features/auth/data/models/login/login_res_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginResModel  loginResModel;

  const LoginSuccess(this.loginResModel);

  @override
  List<Object?> get props => [loginResModel];
}
class SignupSuccess extends AuthState {
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}
