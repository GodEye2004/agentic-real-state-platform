import 'package:flutter_application_1/featured/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_state.dart';
import 'package:flutter_application_1/featured/auth/views/login_screen.dart';
import 'package:flutter_application_1/featured/auth/views/otp_screen.dart';
import 'package:flutter_application_1/featured/auth/views/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final authState = ref.read(authProvider).asData?.value;
      final isAuthenticated = authState is Authenticated;
      final isLoggingIn =
          state.matchedLocation == '/login' ||
          state.matchedLocation.startsWith('/otp');

      // If not authenticated and not on login/OTP → go to login
      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }
      // If authenticated and trying to access login/OTP → go to profile
      if (isAuthenticated && isLoggingIn) {
        return '/profile';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/otp',
        builder: (context, state) {
          final phoneNumber = state.extra as String;
          return OtpScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
});
