import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_talk.freezed.dart';
part 'agent_talk.g.dart';

@freezed
class AgentTalkResponse with _$AgentTalkResponse {
  const factory AgentTalkResponse({
    required String response,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'requires_input') @Default(false) bool requiresInput,
    @JsonKey(name: 'missing_fields') @Default([]) List<String> missingFields,
    @JsonKey(name: 'recommended_properties')
    @Default([])
    List<AgentTalkProperty> recommendedProperties,
    required String state,
  }) = _AgentTalkResponse;

  factory AgentTalkResponse.fromJson(Map<String, dynamic> json) =>
      _$AgentTalkResponseFromJson(json);
      
        @override
        // TODO: implement missingFields
        List<String> get missingFields => throw UnimplementedError();
      
        @override
        // TODO: implement recommendedProperties
        List<AgentTalkProperty> get recommendedProperties => throw UnimplementedError();
      
        @override
        // TODO: implement requiresInput
        bool get requiresInput => throw UnimplementedError();
      
        @override
        // TODO: implement response
        String get response => throw UnimplementedError();
      
        @override
        // TODO: implement sessionId
        String get sessionId => throw UnimplementedError();
      
        @override
        // TODO: implement state
        String get state => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
}

@freezed
class AgentTalkProperty with _$AgentTalkProperty {
  const factory AgentTalkProperty({
    required String id,
    required String title,
    required double price,
    required double area,
    required double vpm,
    int? units,
    required String location,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'source_link') String? sourceLink,
    required String description,
    @JsonKey(name: 'match_percentage') required double matchPercentage,
    required double score,
  }) = _AgentTalkProperty;

  factory AgentTalkProperty.fromJson(Map<String, dynamic> json) =>
      _$AgentTalkPropertyFromJson(json);
      
        @override
        // TODO: implement area
        double get area => throw UnimplementedError();
      
        @override
        // TODO: implement description
        String get description => throw UnimplementedError();
      
        @override
        // TODO: implement id
        String get id => throw UnimplementedError();
      
        @override
        // TODO: implement imageUrl
        String? get imageUrl => throw UnimplementedError();
      
        @override
        // TODO: implement location
        String get location => throw UnimplementedError();
      
        @override
        // TODO: implement matchPercentage
        double get matchPercentage => throw UnimplementedError();
      
        @override
        // TODO: implement price
        double get price => throw UnimplementedError();
      
        @override
        // TODO: implement score
        double get score => throw UnimplementedError();
      
        @override
        // TODO: implement sourceLink
        String? get sourceLink => throw UnimplementedError();
      
        @override
        // TODO: implement title
        String get title => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
      
        @override
        // TODO: implement units
        int? get units => throw UnimplementedError();
      
        @override
        // TODO: implement vpm
        double get vpm => throw UnimplementedError();
}
