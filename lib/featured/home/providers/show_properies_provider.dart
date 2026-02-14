

import 'package:flutter_application_1/config/api/api_service.dart';
import 'package:flutter_application_1/models/properties/propertiesResponse/properties_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final propertiesProvider = FutureProvider<PropertyResponse>((ref) async {
  final api = ApiService();
  return  api.showProperties();
});