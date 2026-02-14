import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/properties/propertiesResponse/properties_response.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _getBaseUrl(),
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );

  static String _getBaseUrl() {
    if (Platform.isIOS) {
      return 'http://localhost:8000';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000';
    } else {
      return 'http://localhost:8000';
    }
  }

  // add token inceptor
  void addTokenInceptor(String token) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }

  // clear token inceptors
  void clearTokenInceptors() {
    _dio.interceptors.clear();
  }

  // send OTP
  Future<String> sendOtp(String phoneNumber) async {
    try {
      final response = await _dio.post(
        "/auth/send-otp",
        data: {"phone_number": phoneNumber},
      );
      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to send OTP');
    }
  }

  //verify OTP
  Future<String> verifyOTP(String phoneNumber, String otp) async {
    try {
      final response = await _dio.post(
        "/verify-otp",
        data: {"phone_number": phoneNumber, "code": otp},
      );
      return response.data['access_token'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to verify OTP');
    }
  }

  //show properties
  Future<PropertyResponse> showProperties() async {
    try {
      final response = await _dio.get('/properties');
      print(response.data);
      return PropertyResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to show properties',
      );
    }
  }

  // get profile
  Future<dynamic> getProfile() async {
    try {
      final response = await _dio.get("/profile");
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to get profile');
    }
  }
}
