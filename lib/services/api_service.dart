import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // تشخیص خودکار platform
  String get baseUrl {
    if (Platform.isIOS) {
      return 'http://localhost:8000'; // iOS simulator
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000'; // Android emulator
    } else {
      return 'http://localhost:8000'; // Default
    }
  }

  String? _sessionId;

  // دریافت یا ایجاد session
  Future<String> getSessionId() async {
    if (_sessionId != null) return _sessionId!;

    final prefs = await SharedPreferences.getInstance();
    _sessionId = prefs.getString('session_id');

    if (_sessionId == null) {
      _sessionId = await createNewSession();
      await prefs.setString('session_id', _sessionId!);
    }

    return _sessionId!;
  }

  // ایجاد session جدید
  Future<String> createNewSession() async {
    try {
      final response = await http
          .post(Uri.parse('$baseUrl/session/new'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return data['session_id'];
      } else {
        throw Exception('Failed to create session');
      }
    } catch (e) {
      print('Error creating session: $e');
      throw Exception(
        'خطا در ایجاد جلسه. لطفا اتصال اینترنت خود را بررسی کنید.',
      );
    }
  }

  // ارسال پیام
  Future<ChatResponse> sendMessage(String message) async {
    try {
      final sessionId = await getSessionId();

      final response = await http
          .post(
            Uri.parse('$baseUrl/chat'),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            body: json.encode({'message': message, 'session_id': sessionId}),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return ChatResponse.fromJson(data);
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      print('Error sending message: $e');
      throw Exception('خطا در ارسال پیام. لطفا دوباره تلاش کنید.');
    }
  }

  // دریافت اطلاعات session
  Future<SessionInfo> getSessionInfo() async {
    try {
      final sessionId = await getSessionId();

      final response = await http
          .get(Uri.parse('$baseUrl/session/$sessionId'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return SessionInfo.fromJson(data);
      } else {
        throw Exception('Failed to get session info');
      }
    } catch (e) {
      print('Error getting session info: $e');
      throw Exception('خطا در دریافت اطلاعات');
    }
  }

  // دریافت حافظه
  Future<Map<String, dynamic>> getMemory() async {
    try {
      final sessionId = await getSessionId();

      final response = await http
          .get(Uri.parse('$baseUrl/session/$sessionId/memory'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return json.decode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('Failed to get memory');
      }
    } catch (e) {
      print('Error getting memory: $e');
      return {};
    }
  }

  // دریافت لیست املاک
  Future<List<Property>> getAllProperties() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/properties'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        final properties = (data['properties'] as List)
            .map((p) => Property.fromJson(p))
            .toList();
        return properties;
      } else {
        throw Exception('Failed to get properties');
      }
    } catch (e) {
      print('Error getting properties: $e');
      throw Exception('خطا در دریافت املاک');
    }
  }

  // بررسی سلامت API
  Future<bool> checkHealth() async {
    try {
      print('Checking API health at: $baseUrl/health');

      final response = await http
          .get(Uri.parse('$baseUrl/health'))
          .timeout(const Duration(seconds: 10));

      print('Health check response: ${response.statusCode}');
      return response.statusCode == 200;
    } catch (e) {
      print('Health check error: $e');
      print('Base URL: $baseUrl');
      return false;
    }
  }

  // پاک کردن session
  Future<void> clearSession() async {
    try {
      if (_sessionId != null) {
        await http.delete(Uri.parse('$baseUrl/session/$_sessionId'));
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('session_id');
      _sessionId = null;
    } catch (e) {
      print('Error clearing session: $e');
    }
  }

  // ثبت آگهی جدید
  Future<Map<String, dynamic>> submitProperty(
    Map<String, dynamic> propertyData,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl/properties/submit'),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            body: json.encode(propertyData),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return json.decode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('Failed to submit property');
      }
    } catch (e) {
      print('Error submitting property: $e');
      throw Exception('خطا در ثبت آگهی');
    }
  }

  // دریافت آگهی‌های کاربر
  Future<List<Map<String, dynamic>>> getUserSubmissions(String userId) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/properties/submissions?user_id=$userId'))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        return List<Map<String, dynamic>>.from(data['submissions']);
      } else {
        throw Exception('Failed to get submissions');
      }
    } catch (e) {
      print('Error getting submissions: $e');
      throw Exception('خطا در دریافت آگهی‌ها');
    }
  }

  // ری‌استارت مکالمه
  Future<void> restartConversation() async {
    await clearSession();
    await getSessionId(); // ایجاد session جدید
  }
}
