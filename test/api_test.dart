import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('send OTP shoould return message', () async {
    final api = ApiService();

    // final result = await api.sendOtp("09113690717");
    final result = await api.getProfile("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMDUyNzc2Yi0zYmEwLTQ2MTUtYmZmNi1hYmY1ZDEzNTRkYmUiLCJleHAiOjE3NzE0ODY5MjZ9.PKbbZfGwvDuve3lLbFQ0zqMlGXmydH_ubIFzlW9Dt50");

    expect(result, isNotEmpty);
  });
}
