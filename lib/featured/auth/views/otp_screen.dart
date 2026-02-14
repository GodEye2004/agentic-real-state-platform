import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/config/theme.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_state.dart';
import 'package:flutter_application_1/featured/auth/widget/auth_button.dart';
import 'package:flutter_application_1/featured/auth/widget/auth_header.dart';
import 'package:flutter_application_1/featured/auth/widget/auth_text_field.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleVerify() {
    if (_otpController.text.trim().isEmpty) return;

    // Dismiss keyboard
    FocusScope.of(context).unfocus();

    ref
        .read(authProvider.notifier)
        .verifyOtp(widget.phoneNumber, _otpController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // Listen to state changes for success navigation or error showing
    ref.listen(authProvider, (previous, next) {
      if (next.value is Authenticated) {
        // Navigate to home or profile on success
        // Using pushReplacement or go to avoid going back to OTP

        // final token = (next.value as Authenticated).token;

        context.go('/profile');
      }

      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا: ${next.error}'),
            backgroundColor: AppTheme.errorColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.textPrimary,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                title: 'تکمیل احراز هویت',
                subtitle:
                    'کد ۴ رقمی ارسال شده به ${widget.phoneNumber} را وارد کنید',
              ),

              const SizedBox(height: 48),

              AuthTextField(
                label: 'کد تایید',
                hint: '----',
                controller: _otpController,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: AppTheme.textSecondary,
                ),
                textInputAction: TextInputAction.done,
                onEditingComplete: _handleVerify,
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),

              const SizedBox(height: 32),

              AuthButton(
                text: 'تایید و ورود',
                isLoading: authState.isLoading,
                onPressed: _handleVerify,
              ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),

              const SizedBox(height: 24),

              Center(
                child: TextButton(
                  onPressed: () {
                    // Resend logic
                    ref.read(authProvider.notifier).sendOtp(widget.phoneNumber);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('کد مجددا ارسال شد'),
                        backgroundColor: AppTheme.secondaryColor,
                      ),
                    );
                  },
                  child: const Text(
                    'ارسال مجدد کد',
                    style: TextStyle(color: AppTheme.primaryColor),
                  ),
                ),
              ).animate().fadeIn(delay: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}
