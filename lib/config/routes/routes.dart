import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: Constants.routeLogin,
  // Add your navigator observers
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey, // Set the navigatorKey
  errorBuilder: (context, state) => ErrorPage(state.error.toString()),
  redirect: (context, state) {
    return null;
  },
  routes: [
    // Login Screen
    GoRoute(
      name: 'Login',
      path: Constants.routeLogin,
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<AuthenticationBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<LoginCubit>(),
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
    ),

    // O.T.P Screen
    GoRoute(
      name: 'O.T.P',
      path: Constants.routeOtpScreen,
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        BlocProvider.value(
          value: AuthenticationBloc(),
          child: const OtpScreen(),
        ),
      ),
    ),

    // User Information Screen
    GoRoute(
      name: 'User-Information',
      path: Constants.routeUserInformationScreen,
      pageBuilder: (context, state) {
        // final data = state.extra as Map<String, dynamic>;

        // final verificationId = data[Constants.verificationId];
        // final phoneNumber = data[Constants.phoneNumber];

        return fadeTransitionPage(
          context,
          state,
          BlocProvider.value(
            value: sl<LoginCubit>(),
            child: const UserInformationScreen(),
          ),
        );
      },
    ),

    // Home Screen
    GoRoute(
      name: 'Home',
      path: Constants.routeHome,
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const HomeScreen(),
      ),
    ),
  ],
);
