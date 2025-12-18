// Message Model
class Message {
  final String id;
  final String content;
  final bool isUser;
  final DateTime timestamp;
  final List<Property>? properties;

  Message({
    required this.id,
    required this.content,
    required this.isUser,
    required this.timestamp,
    this.properties,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? DateTime.now().toString(),
      content: json['content'] ?? '',
      isUser: json['isUser'] ?? false,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
      properties: json['properties'] != null
          ? (json['properties'] as List)
                .map((p) => Property.fromJson(p))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'properties': properties?.map((p) => p.toJson()).toList(),
    };
  }
}

// Property Model
class Property {
  final String id;
  final String title;
  final int price;
  final int area;
  final String location;
  final double matchPercentage;
  final double score;
  final int? bedrooms;
  final int? yearBuilt;
  final String? documentType;
  final bool hasParking;
  final bool hasElevator;
  final bool hasStorage;
  final String? phone;

  Property({
    required this.id,
    required this.title,
    required this.price,
    required this.area,
    required this.location,
    required this.matchPercentage,
    required this.score,
    this.bedrooms,
    this.yearBuilt,
    this.documentType,
    this.hasParking = false,
    this.hasElevator = false,
    this.hasStorage = false,
    this.phone,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      area: json['area'] ?? 0,
      location: json['location'] ?? '',
      matchPercentage: (json['match_percentage'] ?? 0).toDouble(),
      score: (json['score'] ?? 0).toDouble(),
      bedrooms: json['bedrooms'],
      yearBuilt: json['year_built'],
      documentType: json['document_type'],
      hasParking: json['has_parking'] ?? false,
      hasElevator: json['has_elevator'] ?? false,
      hasStorage: json['has_storage'] ?? false,
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'area': area,
      'location': location,
      'match_percentage': matchPercentage,
      'score': score,
      'bedrooms': bedrooms,
      'year_built': yearBuilt,
      'document_type': documentType,
      'has_parking': hasParking,
      'has_elevator': hasElevator,
      'has_storage': hasStorage,
      'phone': phone,
    };
  }

  String get formattedPrice {
    if (price >= 1000000000) {
      return '${(price / 1000000000).toStringAsFixed(1)} میلیارد تومان';
    } else if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(0)} میلیون تومان';
    }
    return '$price تومان';
  }

  String get formattedArea {
    return '$area متر مربع';
  }

  List<String> get facilities {
    List<String> result = [];
    if (hasParking) result.add('پارکینگ');
    if (hasElevator) result.add('آسانسور');
    if (hasStorage) result.add('انباری');
    return result;
  }
}

// Chat Response Model
class ChatResponse {
  final String response;
  final String sessionId;
  final bool requiresInput;
  final List<String> missingFields;
  final String state;
  final List<Property>? recommendedProperties;

  ChatResponse({
    required this.response,
    required this.sessionId,
    required this.requiresInput,
    required this.missingFields,
    required this.state,
    this.recommendedProperties,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      response: json['response'] ?? '',
      sessionId: json['session_id'] ?? '',
      requiresInput: json['requires_input'] ?? false,
      missingFields: List<String>.from(json['missing_fields'] ?? []),
      state: json['state'] ?? '',
      recommendedProperties: json['recommended_properties'] != null
          ? (json['recommended_properties'] as List)
                .map((p) => Property.fromJson(p))
                .toList()
          : null,
    );
  }
}

// Session Info Model
class SessionInfo {
  final String sessionId;
  final String currentStage;
  final int messagesCount;
  final String memorySummary;
  final bool wantsExchange;

  SessionInfo({
    required this.sessionId,
    required this.currentStage,
    required this.messagesCount,
    required this.memorySummary,
    required this.wantsExchange,
  });

  factory SessionInfo.fromJson(Map<String, dynamic> json) {
    return SessionInfo(
      sessionId: json['session_id'] ?? '',
      currentStage: json['current_stage'] ?? '',
      messagesCount: json['messages_count'] ?? 0,
      memorySummary: json['memory_summary'] ?? '',
      wantsExchange: json['wants_exchange'] ?? false,
    );
  }
}
