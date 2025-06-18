import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<SignupEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onSignup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepo.signup(event.signupReq);
    result.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (res) => emit(SignupSuccess()),
    );
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepo.login(event.loginReq);
    result.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (res) => emit(LoginSuccess(res)),
    );
  }
}
