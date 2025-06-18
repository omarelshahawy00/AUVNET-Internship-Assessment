import 'package:equatable/equatable.dart';
import 'package:nawel/features/auth/data/models/login/login_req_model.dart';
import 'package:nawel/features/auth/data/models/sign_up/signup_req_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignupEvent extends AuthEvent {
  final SignupReqModel signupReq;

  const SignupEvent(this.signupReq);

  @override
  List<Object?> get props => [signupReq];
}

class LoginEvent extends AuthEvent {
  final LoginReqModel loginReq;

  const LoginEvent(this.loginReq);

  @override
  List<Object?> get props => [loginReq];
}
