import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured/agent/views/chat_screen.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_state.dart';
import 'package:flutter_application_1/featured/auth/views/login_screen.dart';
import 'package:flutter_application_1/featured/auth/views/otp_screen.dart';
import 'package:flutter_application_1/featured/auth/views/profile_screen.dart';
import 'package:flutter_application_1/featured/home/views/home_screen.dart';
import 'package:flutter_application_1/featured/property-submit/properties_submit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider);

      // Handle loading state - stay on current page or could redirect to splash
      if (authState.isLoading) return null;

      final isAuthenticated = authState.asData?.value is Authenticated;

      final isLoggingIn =
          state.matchedLocation == '/login' ||
          state.matchedLocation.startsWith('/otp');

      // If not authenticated and not on login/OTP → go to login
      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/home';
      }

      // If authenticated and trying to access login/OTP → go to profile
      // if (isAuthenticated && isLoggingIn) {
      //   return '/profile';
      // }

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
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/property-submit',
        builder: (context, state) => const AddPropertyScreen(),
      ),
      GoRoute(
        path: '/talkToAgent',
        builder: (context, state) => const ChatPage(),
      ),
    ],
  );
});

/// A ChangeNotifier that notifies listeners when the auth state changes.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<AuthState>>(
      authProvider,
      (_, __) => notifyListeners(),
    );
  }
}
