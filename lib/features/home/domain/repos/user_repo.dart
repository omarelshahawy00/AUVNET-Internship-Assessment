import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/firebase_exp.dart';
import 'package:nawel/features/home/data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel>> getUserData(String userId);
}
