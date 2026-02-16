// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyResponse _$PropertyResponseFromJson(Map<String, dynamic> json) =>
    _PropertyResponse(
      count: (json['count'] as num).toInt(),
      properties: (json['properties'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertyResponseToJson(_PropertyResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'properties': instance.properties,
    };

_Property _$PropertyFromJson(Map<String, dynamic> json) => _Property(
  id: json['id'] as String,
  title: json['title'] as String,
  propertyType: json['property_type'] as String,
  transactionType: json['transaction_type'] as String,
  price: (json['price'] as num?)?.toInt() ?? 0,
  area: (json['area'] as num?)?.toInt() ?? 0,
  city: json['city'] as String,
  district: json['district'] as String,
  bedrooms: (json['bedrooms'] as num?)?.toInt() ?? 0,
  yearBuilt: (json['year_built'] as num?)?.toInt() ?? 0,
  floor: (json['floor'] as num?)?.toInt() ?? 0,
  totalFloors: (json['total_floors'] as num?)?.toInt() ?? 0,
  documentType: json['document_type'] as String?,
  hasParking: json['has_parking'] as bool,
  hasElevator: json['has_elevator'] as bool,
  hasStorage: json['has_storage'] as bool,
  isRenovated: json['is_renovated'] as bool,
  openToExchange: json['open_to_exchange'] as bool,
  exchangePreferences: (json['exchange_preferences'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ownerPhone: json['owner_phone'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$PropertyToJson(_Property instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'property_type': instance.propertyType,
  'transaction_type': instance.transactionType,
  'price': instance.price,
  'area': instance.area,
  'city': instance.city,
  'district': instance.district,
  'bedrooms': instance.bedrooms,
  'year_built': instance.yearBuilt,
  'floor': instance.floor,
  'total_floors': instance.totalFloors,
  'document_type': instance.documentType,
  'has_parking': instance.hasParking,
  'has_elevator': instance.hasElevator,
  'has_storage': instance.hasStorage,
  'is_renovated': instance.isRenovated,
  'open_to_exchange': instance.openToExchange,
  'exchange_preferences': instance.exchangePreferences,
  'owner_phone': instance.ownerPhone,
  'description': instance.description,
};
