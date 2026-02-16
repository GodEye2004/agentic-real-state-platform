import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/agentTalk/agent_talk.dart';
import 'package:flutter_application_1/models/properties/propertiesResponse/properties_response.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  String? _token;

  ApiService._internal() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) {
          if (_token != null) {
            option.headers['Authorization'] = 'Bearer $_token';
          }
          return handler.next(option);
        },
      ),
    );
  }

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
  // void addTokenInceptor(String token) {
  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         options.headers['Authorization'] = 'Bearer $token';
  //         return handler.next(options);
  //       },
  //     ),
  //   );
  // }

  // clear token inceptors
  // void clearTokenInceptors() {
  //   _dio.interceptors.clear();
  // }

  void setToken(String token) {
    _token = token;
  }

  void clearToken() {
    _token = null;
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

  Future<Map<String, dynamic>> submitProperty(
    Map<String, dynamic> propertyData,
  ) async {
    try {
      final response = await _dio.post(
        "/properties/submit",
        data: propertyData,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
        'Failed to submit property: ${e.response?.data['message']}',
      );
    }
  }

  // talk to graph in backend
  Future<AgentTalkResponse> talkToAgent(String message) async {
    try {
      final response = await _dio.post(
        "/chat",
        data: {"message": message},
        options: Options(
          sendTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      );

      print(response.data);

      final data = response.data;
      if (data == null || data is! Map<String, dynamic>) {
        throw Exception('Invalid API response');
      }

      return AgentTalkResponse.fromJson(data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception('Request timed out after 20 seconds');
      }

      throw Exception(e.response?.data['message'] ?? 'Failed to talk to agent');
    }
  }
}
