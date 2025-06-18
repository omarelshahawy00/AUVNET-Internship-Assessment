import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/functions/show_custom_dialog.dart';
import 'package:nawel/features/auth/manager/bloc/auth_bloc.dart';
import 'package:nawel/features/auth/manager/bloc/auth_state.dart';
import 'package:nawel/features/auth/sign_up/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignUpBlocListener()));
  }
}

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

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
          case SignupSuccess():
            context.pop();
            context.pop();
            showCustomDialog(
              context: context,
              type: DialogType.success,
              message: 'Account created successfully!',
            );

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
      child: const SignUpViewBody(),
    );
  }
}
