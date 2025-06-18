import 'package:dartz/dartz.dart';
import 'package:nawel/core/errors/firebase_exp.dart';
import 'package:nawel/features/home/data/data_source/home_local_data_source.dart';
import 'package:nawel/features/home/data/data_source/home_remote_data_source.dart';
import 'package:nawel/features/home/data/models/user_model.dart';
import 'package:nawel/features/home/domain/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  UserRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> getUserData(String userId) async {
    // First, always try to get cached data
    try {
      final cachedUser = await homeLocalDataSource.getCachedUserData(userId);
      if (cachedUser != null) {
        return Right(cachedUser);
      }
    } catch (e) {
      return Left(FirebaseFailure('Failed to fetch cached user data: $e'));
    }

    // If no cached data, try remote regardless of network status
    try {
      final user = await homeRemoteDataSource.getUserData(userId);
      // Cache the user data for future offline use
      await homeLocalDataSource.cacheUserData(user);

      return Right(user);
    } catch (e) {
      return Left(FirebaseFailure('Failed to fetch user data: $e'));
    }
  }
}
