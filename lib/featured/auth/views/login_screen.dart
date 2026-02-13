import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/config/theme.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/featured/auth/widget/auth_button.dart';
import 'package:flutter_application_1/featured/auth/widget/auth_header.dart';
import 'package:flutter_application_1/featured/auth/widget/auth_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();

  // Basic validation
  bool get _isValid => _phoneController.text.trim().length >= 10;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (!_isValid) return;

    // Dismiss keyboard
    FocusScope.of(context).unfocus();

    await ref.read(authProvider.notifier).sendOtp(_phoneController.text.trim());

    // Check if mounted before navigating
    if (mounted) {
      final authState = ref.read(authProvider);

      if (!authState.hasError) {
        context.push('/otp', extra: _phoneController.text.trim());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا: ${authState.error}'),
            backgroundColor: AppTheme.errorColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Header Section
              const AuthHeader(
                title: 'شروع کنید',
                subtitle: 'برای ورود یا ثبت نام، شماره موبایل خود را وارد کنید',
              ),

              const SizedBox(height: 48),

              // Form Section
              AuthTextField(
                label: 'شماره موبایل',
                hint: '0912xxxxxxx',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: AppTheme.textSecondary,
                ),
                textInputAction: TextInputAction.done,
                onEditingComplete: _handleLogin,
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),

              const SizedBox(height: 32),

              // Action Button
              AuthButton(
                text: 'دریافت کد تایید',
                isLoading: authState.isLoading,
                onPressed: _handleLogin,
              ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),

              // Error Display (optional, if not handled in SnackBar)
              if (authState.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      '${authState.error}',
                      style: const TextStyle(color: AppTheme.errorColor),
                    ),
                  ),
                ).animate().fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}
