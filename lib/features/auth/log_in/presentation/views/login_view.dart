import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/functions/show_custom_dialog.dart';
import 'package:nawel/core/routes/routes.dart';
import 'package:nawel/features/auth/log_in/presentation/views/widgets/login_view_body.dart';
import 'package:nawel/features/auth/manager/bloc/auth_bloc.dart';
import 'package:nawel/features/auth/manager/bloc/auth_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LoginBlocListener()));
  }
}

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state) {
          case AuthLoading():
            showCustomDialog(
              context: context,
              type: DialogType.loading,
              message: 'Loading...',
            );
            break;
          case LoginSuccess():
            context.pop();
            context.pushNamed(Routes.home);
            break;
          case AuthFailure():
            context.pop();
            showCustomDialog(
              context: context,
              type: DialogType.failure,
              message: state.message,
            );
            break;
          default:
            break;
        }
      },
      child: const LoginViewBody(),
    );
  }
}
