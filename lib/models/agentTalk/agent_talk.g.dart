// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_talk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgentTalkResponse _$AgentTalkResponseFromJson(Map<String, dynamic> json) =>
    _AgentTalkResponse(
      response: json['response'] as String,
      sessionId: json['session_id'] as String,
      requiresInput: json['requires_input'] as bool? ?? false,
      missingFields:
          (json['missing_fields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recommendedProperties:
          (json['recommended_properties'] as List<dynamic>?)
              ?.map(
                (e) => AgentTalkProperty.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      state: json['state'] as String,
    );

Map<String, dynamic> _$AgentTalkResponseToJson(_AgentTalkResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'session_id': instance.sessionId,
      'requires_input': instance.requiresInput,
      'missing_fields': instance.missingFields,
      'recommended_properties': instance.recommendedProperties,
      'state': instance.state,
    };

_AgentTalkProperty _$AgentTalkPropertyFromJson(Map<String, dynamic> json) =>
    _AgentTalkProperty(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      vpm: (json['vpm'] as num).toDouble(),
      units: (json['units'] as num?)?.toInt(),
      location: json['location'] as String,
      imageUrl: json['image_url'] as String?,
      sourceLink: json['source_link'] as String?,
      description: json['description'] as String,
      matchPercentage: (json['match_percentage'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$AgentTalkPropertyToJson(_AgentTalkProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'area': instance.area,
      'vpm': instance.vpm,
      'units': instance.units,
      'location': instance.location,
      'image_url': instance.imageUrl,
      'source_link': instance.sourceLink,
      'description': instance.description,
      'match_percentage': instance.matchPercentage,
      'score': instance.score,
    };
