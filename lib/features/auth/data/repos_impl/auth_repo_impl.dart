import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/firebase_exp.dart';
import 'package:nawel/core/network/constants/api_constant.dart';
import 'package:nawel/core/network/services/data_base_service.dart';
import 'package:nawel/core/network/services/firebase_auth_service.dart';
import 'package:nawel/features/auth/data/models/login/login_req_model.dart';
import 'package:nawel/features/auth/data/models/login/login_res_model.dart';
import 'package:nawel/features/auth/data/models/sign_up/signup_req_model.dart';
import 'package:nawel/features/auth/data/models/sign_up/signup_res_model.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService authService;
  final DataBaseService firestore;
  AuthRepoImpl({required this.authService, required this.firestore});

  @override
  Future<Either<Failure, SignupResModel>> signup(
    SignupReqModel signupReqModel,
  ) async {
    try {
      // 1. Create user in Firebase Auth
      final user = await authService.createUserWithEmailAndPassword(
        email: signupReqModel.email!,
        password: signupReqModel.password!,
      );
      var uid = user.uid;
      var userData =
          SignupReqModel(
            uid: uid,
            name: signupReqModel.name,
            email: signupReqModel.email,
          ).toJson();
      // 2. Store additional user data in Firestore
      await firestore.addData(
        data: userData,
        path: ApiConstant.addUserData,
        docId: user.uid,
      );
      // 3. Get the user data from Firestore

      return Right(
        SignupResModel(
          id: user.uid,
          email: user.email ?? '',
          name: signupReqModel.name ?? '',
        ),
      );
    } on FirebaseFailure catch (e) {
      return Left(FirebaseFailure(e.errMessage));
    } catch (e) {
      return Left(FirebaseFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, LoginResModel>> login(
    LoginReqModel loginReqModel,
  ) async {
    try {
      final user = await authService.signInWithEmailAndPassword(
        loginReqModel.email,
        loginReqModel.password,
      );
      final userData = await firestore.getData(
        path: ApiConstant.getUserData,
        uId: user.uid,
      );

      return Right(LoginResModel.fromJson(userData));
    } on FirebaseFailure catch (e) {
      return Left(FirebaseFailure(e.errMessage));
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

}
// auth_repo_impl.dart
// import 'package:dartz/dartz.dart';
// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:nawel/core/connection/network_info.dart';
// import 'package:nawel/core/errors/failures.dart' hide Failure;
// import 'package:nawel/core/errors/firebase_exp.dart';
// import 'package:nawel/features/home/data/models/user_model.dart';
// import 'package:nawel/features/auth/data/data_source/auth_local_data_source.dart';
// import 'package:nawel/features/auth/data/data_source/auth_remote_data_source.dart';

// import 'package:nawel/features/auth/data/models/login/login_req_model.dart';
// import 'package:nawel/features/auth/data/models/login/login_res_model.dart';
// import 'package:nawel/features/auth/data/models/sign_up/signup_req_model.dart';
// import 'package:nawel/features/auth/data/models/sign_up/signup_res_model.dart';
// import 'package:nawel/features/auth/domain/repos/auth_repo.dart';

// class AuthRepoImpl implements AuthRepo {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;
//   NetworkInfo networkInfo;

//   AuthRepoImpl({required this.remoteDataSource, required this.localDataSource , required this.networkInfo});

//   @override
//   Future<Either<Failure, SignupResModel>> signup(
//     SignupReqModel signupReqModel,
//   ) async {
//     try {
//       final user = await remoteDataSource.signup(signupReqModel);

//       final signupRes = SignupResModel(
//         id: user.id,
//         email: user.email,
//         name: user.name ?? '',
//       );

//       await localDataSource.cacheUserData(user);
//       return Right(signupRes);
//     } on FirebaseFailure catch (e) {
//       return Left(FirebaseFailure(e.errMessage));
//     } catch (e) {
//       return const Left(Failure('An unexpected error occurred'));
//     }
//   }

//   @override
//   Future<Either<Failure, LoginResModel>> login(
//     LoginReqModel loginReqModel,
//   ) async {
//     try {
//       final user = await remoteDataSource.login(loginReqModel);

//       final loginRes = LoginResModel(
//         uid: user.id,
//         email: user.email,
//         name: user.name ?? '',
//       );

//       await localDataSource.cacheUserData(user);

//       return Right(loginRes);
//     } on FirebaseFailure catch (e) {
//       return Left(FirebaseFailure(e.errMessage));
//     } catch (e) {
//       return const Left(Failure('An unexpected error occurred'));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> cacheUserData(UserModel user) async {
//     try {
//       await localDataSource.cacheUserData(user);
//       return const Right(null);
//     } catch (e) {
//       return Left(Failure('Failed to cache user data: ${e.toString()}'));
//     }
//   }

//   @override
//   Future<Either<Failure, UserModel?>> getCachedUserData(String userId) async {
//     try {
//       final user = await localDataSource.getCachedUserData(userId);
//       return Right(user);
//     } catch (e) {
//       return Left(Failure('Failed to retrieve cached user: ${e.toString()}'));
//     }
//   }
// }
