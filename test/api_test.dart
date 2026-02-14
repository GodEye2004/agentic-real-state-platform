import 'package:flutter_application_1/config/api/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('show properties', () async {
    final api = ApiService();

    // final result = await api.sendOtp("09113690717");
    await api.showProperties();

    // showProperties() returns void, so there's no value to print

  });
}
