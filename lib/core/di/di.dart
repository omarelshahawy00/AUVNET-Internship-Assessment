import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:nawel/core/network/services/data_base_service.dart';
import 'package:nawel/core/network/services/fire_store_service.dart';
import 'package:nawel/core/network/services/firebase_auth_service.dart';
import 'package:nawel/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:nawel/features/home/data/repos_impl/user_repo_impl.dart';
import 'package:nawel/features/home/data/data_source/home_local_data_source.dart';
import 'package:nawel/features/home/data/data_source/home_remote_data_source.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';
import 'package:nawel/features/home/domain/repos/user_repo.dart';
import 'package:nawel/features/home/presentation/bloc/user_bloc.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  // Firebase services
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerSingleton<DataBaseService>(FireStoreService());

  // Data sources
  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSource(firestore: getIt<DataBaseService>()),
  );
  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl());

  // Repositories
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<FirebaseAuthService>(),
      firestore: getIt<DataBaseService>(),
    ),
  );

  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );

  // Blocs
  getIt.registerFactory<UserBloc>(() => UserBloc(getIt<UserRepo>()));
}
