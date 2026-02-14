import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties_response.freezed.dart';
part 'properties_response.g.dart';

@freezed
class PropertyResponse with _$PropertyResponse {
  const factory PropertyResponse({
    required int count,
    required List<Property> properties, // Pointing to the Property class below
  }) = _PropertyResponse;

  factory PropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyResponseFromJson(json);

  @override
  // TODO: implement count
  int get count => throw UnimplementedError();

  @override
  // TODO: implement properties
  List<Property> get properties => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

@freezed
class Property with _$Property {
  const factory Property({
    required String id,
    required String title,
    @JsonKey(name: 'property_type') required String propertyType,
    @JsonKey(name: 'transaction_type') required String transactionType,
    required int price,
    required int area,
    required String city,
    required String district,
    required int bedrooms,
    @JsonKey(name: 'year_built') required int yearBuilt,
    required int floor,
    @JsonKey(name: 'total_floors') required int totalFloors,
    @JsonKey(name: 'document_type') String? documentType,
    @JsonKey(name: 'has_parking') required bool hasParking,
    @JsonKey(name: 'has_elevator') required bool hasElevator,
    @JsonKey(name: 'has_storage') required bool hasStorage,
    @JsonKey(name: 'is_renovated') required bool isRenovated,
    @JsonKey(name: 'open_to_exchange') required bool openToExchange,
    @JsonKey(name: 'exchange_preferences') List<String>? exchangePreferences,
    @JsonKey(name: 'owner_phone') required String ownerPhone,
    required String description,
  }) = _Property; // Internal name changed to _Property

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  @override
  // TODO: implement area
  int get area => throw UnimplementedError();

  @override
  // TODO: implement bedrooms
  int get bedrooms => throw UnimplementedError();

  @override
  // TODO: implement city
  String get city => throw UnimplementedError();

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement district
  String get district => throw UnimplementedError();

  @override
  // TODO: implement documentType
  String? get documentType => throw UnimplementedError();

  @override
  // TODO: implement exchangePreferences
  List<String>? get exchangePreferences => throw UnimplementedError();

  @override
  // TODO: implement floor
  int get floor => throw UnimplementedError();

  @override
  // TODO: implement hasElevator
  bool get hasElevator => throw UnimplementedError();

  @override
  // TODO: implement hasParking
  bool get hasParking => throw UnimplementedError();

  @override
  // TODO: implement hasStorage
  bool get hasStorage => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement isRenovated
  bool get isRenovated => throw UnimplementedError();

  @override
  // TODO: implement openToExchange
  bool get openToExchange => throw UnimplementedError();

  @override
  // TODO: implement ownerPhone
  String get ownerPhone => throw UnimplementedError();

  @override
  // TODO: implement price
  int get price => throw UnimplementedError();

  @override
  // TODO: implement propertyType
  String get propertyType => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement totalFloors
  int get totalFloors => throw UnimplementedError();

  @override
  // TODO: implement transactionType
  String get transactionType => throw UnimplementedError();

  @override
  // TODO: implement yearBuilt
  int get yearBuilt => throw UnimplementedError();
}
