import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  // Add your navigator observers
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey, // Set the navigatorKey
  errorBuilder: (context, state) => ErrorPage(state.error.toString()),
  redirect: (context, state) {
    return null;
  },
  routes: [
    GoRoute(
      name: 'login',
      path: '/',
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
    GoRoute(
      name: 'otp-verification',
      path: '/otp-verification',
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        BlocProvider.value(
          value: sl<LoginCubit>(),
          child: const OtpScreen(),
        ),
      ),
    ),
  ],
);
