import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/di/di.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';
import 'package:nawel/features/auth/log_in/presentation/views/login_view.dart';
import 'package:nawel/features/auth/manager/bloc/auth_bloc.dart';
import 'package:nawel/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:nawel/features/home/domain/repos/user_repo.dart';
import 'package:nawel/features/home/presentation/bloc/user_bloc.dart';
import 'package:nawel/features/home/presentation/views/home_view.dart';
import 'package:nawel/features/navigation/presentation/views/main_navigation_view.dart';
import 'package:nawel/features/onboarding/onboarding_vieiw.dart';
import 'package:nawel/features/splash/splash_view.dart';

// GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return const MainNavWrapper(); // <- Here we build PersistentTabView
        },
        routes: [
          GoRoute(
            path: Routes.home,
            name: Routes.home,
            builder:
                (context, state) => BlocProvider(
                  create: (context) => UserBloc(getIt.get<UserRepo>()),
                  child: const HomeView(),
                ),
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(getIt.get<AuthRepo>()),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: Routes.singUp,
        name: Routes.singUp,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthBloc(getIt.get<AuthRepo>()),
              child: const SignUpView(),
            ),
      ),
      GoRoute(
        path: Routes.onboarding,
        name: Routes.onboarding,
        builder: (context, state) => const OnboardingVieiw(),
      ),
    ],
  );
}

class Routes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String delivery = '/delivery';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String singUp = '/signup';
  static const String onboarding = '/onboarding';
}
