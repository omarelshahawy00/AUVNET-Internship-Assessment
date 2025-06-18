import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nawel/features/home/domain/repos/user_repo.dart';
import 'package:nawel/features/home/presentation/bloc/user_events.dart';
import 'package:nawel/features/home/presentation/bloc/user_state.dart';

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;

  UserBloc(this.userRepo) : super(UserInitial()) {
    on<LoadUserData>(_onLoadUserData);
  }

  Future<void> _onLoadUserData(
    LoadUserData event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    final result = await userRepo.getUserData(event.userId);

    result.fold(
      (failure) {
        emit(UserError(failure.errMessage));
      },
      (user) {
       
        emit(UserLoaded(user));
      },
    );
  }
}
