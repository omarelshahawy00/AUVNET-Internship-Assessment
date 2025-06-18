import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/firebase_exp.dart';
import 'package:nawel/features/auth/data/models/login/login_req_model.dart';
import 'package:nawel/features/auth/data/models/login/login_res_model.dart';
import 'package:nawel/features/auth/data/models/sign_up/signup_req_model.dart';
import 'package:nawel/features/auth/data/models/sign_up/signup_res_model.dart';


abstract class AuthRepo {
  Future<Either<Failure, SignupResModel>> signup(SignupReqModel signupReqModel);
  Future<Either<Failure, LoginResModel>> login(LoginReqModel loginReqModel);

}
