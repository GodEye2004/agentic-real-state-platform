import 'package:flutter_application_1/screens/landing/landing.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/', builder: (context, state) => const Landing()),
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) => const LoginPage(),
    // ),
    // GoRoute(
    //   path: '/profile/:id',
    //   builder: (context, state) {
    //     final id = state.params['id']!;
    //     return ProfilePage(userId: id);
    //   },
    // ),
  ],
);
