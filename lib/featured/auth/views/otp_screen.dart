import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured/auth/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    // final authState = ref.watch(authProvider);

    // // Listen to authentication state changes for navigation
    // ref.listen<AsyncValue<AuthState>>(authProvider, (_, next) {
    //   next.whenOrNull(
    //     data: (state) {
    //       if (state is Authenticated) {
    //         Navigator.pushReplacementNamed(context, '/profile');
    //       }
    //     },
    //     error: (error, stack) {
    //       ScaffoldMessenger.of(
    //         context,
    //       ).showSnackBar(SnackBar(content: Text(error.toString())));
    //     },
    //   );
    // });

    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the code sent to ${widget.phoneNumber}'),
            const SizedBox(height: 20),
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(labelText: 'OTP Code'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(authProvider.notifier)
                    .verifyOtp(widget.phoneNumber, _otpController.text.trim());
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
