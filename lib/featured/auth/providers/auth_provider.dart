// keep this as a regular provider for the notifier
import 'package:flutter_application_1/config/api/api_service.dart';
import 'package:flutter_application_1/config/storage/secure_storage.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_state.dart';
import 'package:flutter_application_1/models/auth/user-profile/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/framework.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<AuthState> {
  late final ApiService _apiService;
  late final SecureStorage _secureStorage;

  @override
  Future<AuthState> build() async {
    _apiService = ref.read(apiServiceProvider);
    _secureStorage = ref.read(secureStorageProvider);

    // check if the token exist
    final token = await _secureStorage.getToken();
    if (token != null) {
      _apiService.setToken(token);
      try {
        final userData = await _apiService.getProfile();
        final user = Profile.fromJson(userData);

        // why we use it, because we want to keep the user logged in
        return Authenticated(user);
      } catch (e) {
        // token invalid or expired
        await _secureStorage.deleteToken();
        // _apiService.clearTokenInceptors();
        ApiService().clearToken();
        return const AuthUnauthenticated();
      }
    }
    return const AuthUnauthenticated();
  }

  // TODO: Send Otp
  Future<void> sendOtp(String phoneNumber) async {
    state = const AsyncValue.loading();
    try {
      await _apiService.sendOtp(phoneNumber);
      state = const AsyncValue.data(AuthUnauthenticated());
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  // TODO: verify Otp
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    state = const AsyncValue.loading();
    try {
      final token = await _apiService.verifyOTP(phoneNumber, otp);
      _apiService.setToken(token);
      await _secureStorage.saveToken(token);
      // _apiService.addTokenInceptor(token);

      // fetch user profile
      final userData = await _apiService.getProfile();
      final user = Profile.fromJson(userData);
      state = AsyncValue.data(Authenticated(user));
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  // TODO: log out
  Future<void> logOut() async {
    state = const AsyncValue.loading();
    await _secureStorage.deleteToken();
    // _apiService.clearTokenInceptors();
    _apiService.clearToken();
    state = const AsyncValue.data(AuthUnauthenticated());
  }
}

// provider for apiservice and securstorage (singleton)
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
final secureStorageProvider = Provider<SecureStorage>((ref) => SecureStorage());
