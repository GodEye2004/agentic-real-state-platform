// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'properties_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyResponse {

 int get count; List<Property> get properties;
/// Create a copy of PropertyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyResponseCopyWith<PropertyResponse> get copyWith => _$PropertyResponseCopyWithImpl<PropertyResponse>(this as PropertyResponse, _$identity);

  /// Serializes this PropertyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyResponse&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.properties, properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,const DeepCollectionEquality().hash(properties));

@override
String toString() {
  return 'PropertyResponse(count: $count, properties: $properties)';
}


}

/// @nodoc
abstract mixin class $PropertyResponseCopyWith<$Res>  {
  factory $PropertyResponseCopyWith(PropertyResponse value, $Res Function(PropertyResponse) _then) = _$PropertyResponseCopyWithImpl;
@useResult
$Res call({
 int count, List<Property> properties
});




}
/// @nodoc
class _$PropertyResponseCopyWithImpl<$Res>
    implements $PropertyResponseCopyWith<$Res> {
  _$PropertyResponseCopyWithImpl(this._self, this._then);

  final PropertyResponse _self;
  final $Res Function(PropertyResponse) _then;

/// Create a copy of PropertyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? properties = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as List<Property>,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertyResponse].
extension PropertyResponsePatterns on PropertyResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyResponse value)  $default,){
final _that = this;
switch (_that) {
case _PropertyResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  List<Property> properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyResponse() when $default != null:
return $default(_that.count,_that.properties);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  List<Property> properties)  $default,) {final _that = this;
switch (_that) {
case _PropertyResponse():
return $default(_that.count,_that.properties);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  List<Property> properties)?  $default,) {final _that = this;
switch (_that) {
case _PropertyResponse() when $default != null:
return $default(_that.count,_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyResponse implements PropertyResponse {
  const _PropertyResponse({required this.count, required final  List<Property> properties}): _properties = properties;
  factory _PropertyResponse.fromJson(Map<String, dynamic> json) => _$PropertyResponseFromJson(json);

@override final  int count;
 final  List<Property> _properties;
@override List<Property> get properties {
  if (_properties is EqualUnmodifiableListView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_properties);
}


/// Create a copy of PropertyResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyResponseCopyWith<_PropertyResponse> get copyWith => __$PropertyResponseCopyWithImpl<_PropertyResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyResponse&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._properties, _properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,const DeepCollectionEquality().hash(_properties));

@override
String toString() {
  return 'PropertyResponse(count: $count, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$PropertyResponseCopyWith<$Res> implements $PropertyResponseCopyWith<$Res> {
  factory _$PropertyResponseCopyWith(_PropertyResponse value, $Res Function(_PropertyResponse) _then) = __$PropertyResponseCopyWithImpl;
@override @useResult
$Res call({
 int count, List<Property> properties
});




}
/// @nodoc
class __$PropertyResponseCopyWithImpl<$Res>
    implements _$PropertyResponseCopyWith<$Res> {
  __$PropertyResponseCopyWithImpl(this._self, this._then);

  final _PropertyResponse _self;
  final $Res Function(_PropertyResponse) _then;

/// Create a copy of PropertyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? properties = null,}) {
  return _then(_PropertyResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as List<Property>,
  ));
}


}


/// @nodoc
mixin _$Property {

 String get id; String get title;@JsonKey(name: 'property_type') String get propertyType;@JsonKey(name: 'transaction_type') String get transactionType; int get price; int get area; String get city; String get district; int get bedrooms;@JsonKey(name: 'year_built') int get yearBuilt; int get floor;@JsonKey(name: 'total_floors') int get totalFloors;@JsonKey(name: 'document_type') String? get documentType;@JsonKey(name: 'has_parking') bool get hasParking;@JsonKey(name: 'has_elevator') bool get hasElevator;@JsonKey(name: 'has_storage') bool get hasStorage;@JsonKey(name: 'is_renovated') bool get isRenovated;@JsonKey(name: 'open_to_exchange') bool get openToExchange;@JsonKey(name: 'exchange_preferences') List<String>? get exchangePreferences;@JsonKey(name: 'owner_phone') String get ownerPhone; String get description;
/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyCopyWith<Property> get copyWith => _$PropertyCopyWithImpl<Property>(this as Property, _$identity);

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Property&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.propertyType, propertyType) || other.propertyType == propertyType)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.area, area) || other.area == area)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.yearBuilt, yearBuilt) || other.yearBuilt == yearBuilt)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.hasParking, hasParking) || other.hasParking == hasParking)&&(identical(other.hasElevator, hasElevator) || other.hasElevator == hasElevator)&&(identical(other.hasStorage, hasStorage) || other.hasStorage == hasStorage)&&(identical(other.isRenovated, isRenovated) || other.isRenovated == isRenovated)&&(identical(other.openToExchange, openToExchange) || other.openToExchange == openToExchange)&&const DeepCollectionEquality().equals(other.exchangePreferences, exchangePreferences)&&(identical(other.ownerPhone, ownerPhone) || other.ownerPhone == ownerPhone)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,propertyType,transactionType,price,area,city,district,bedrooms,yearBuilt,floor,totalFloors,documentType,hasParking,hasElevator,hasStorage,isRenovated,openToExchange,const DeepCollectionEquality().hash(exchangePreferences),ownerPhone,description]);

@override
String toString() {
  return 'Property(id: $id, title: $title, propertyType: $propertyType, transactionType: $transactionType, price: $price, area: $area, city: $city, district: $district, bedrooms: $bedrooms, yearBuilt: $yearBuilt, floor: $floor, totalFloors: $totalFloors, documentType: $documentType, hasParking: $hasParking, hasElevator: $hasElevator, hasStorage: $hasStorage, isRenovated: $isRenovated, openToExchange: $openToExchange, exchangePreferences: $exchangePreferences, ownerPhone: $ownerPhone, description: $description)';
}


}

/// @nodoc
abstract mixin class $PropertyCopyWith<$Res>  {
  factory $PropertyCopyWith(Property value, $Res Function(Property) _then) = _$PropertyCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'property_type') String propertyType,@JsonKey(name: 'transaction_type') String transactionType, int price, int area, String city, String district, int bedrooms,@JsonKey(name: 'year_built') int yearBuilt, int floor,@JsonKey(name: 'total_floors') int totalFloors,@JsonKey(name: 'document_type') String? documentType,@JsonKey(name: 'has_parking') bool hasParking,@JsonKey(name: 'has_elevator') bool hasElevator,@JsonKey(name: 'has_storage') bool hasStorage,@JsonKey(name: 'is_renovated') bool isRenovated,@JsonKey(name: 'open_to_exchange') bool openToExchange,@JsonKey(name: 'exchange_preferences') List<String>? exchangePreferences,@JsonKey(name: 'owner_phone') String ownerPhone, String description
});




}
/// @nodoc
class _$PropertyCopyWithImpl<$Res>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._self, this._then);

  final Property _self;
  final $Res Function(Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? propertyType = null,Object? transactionType = null,Object? price = null,Object? area = null,Object? city = null,Object? district = null,Object? bedrooms = null,Object? yearBuilt = null,Object? floor = null,Object? totalFloors = null,Object? documentType = freezed,Object? hasParking = null,Object? hasElevator = null,Object? hasStorage = null,Object? isRenovated = null,Object? openToExchange = null,Object? exchangePreferences = freezed,Object? ownerPhone = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,propertyType: null == propertyType ? _self.propertyType : propertyType // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,yearBuilt: null == yearBuilt ? _self.yearBuilt : yearBuilt // ignore: cast_nullable_to_non_nullable
as int,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,totalFloors: null == totalFloors ? _self.totalFloors : totalFloors // ignore: cast_nullable_to_non_nullable
as int,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,hasParking: null == hasParking ? _self.hasParking : hasParking // ignore: cast_nullable_to_non_nullable
as bool,hasElevator: null == hasElevator ? _self.hasElevator : hasElevator // ignore: cast_nullable_to_non_nullable
as bool,hasStorage: null == hasStorage ? _self.hasStorage : hasStorage // ignore: cast_nullable_to_non_nullable
as bool,isRenovated: null == isRenovated ? _self.isRenovated : isRenovated // ignore: cast_nullable_to_non_nullable
as bool,openToExchange: null == openToExchange ? _self.openToExchange : openToExchange // ignore: cast_nullable_to_non_nullable
as bool,exchangePreferences: freezed == exchangePreferences ? _self.exchangePreferences : exchangePreferences // ignore: cast_nullable_to_non_nullable
as List<String>?,ownerPhone: null == ownerPhone ? _self.ownerPhone : ownerPhone // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Property].
extension PropertyPatterns on Property {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Property value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Property value)  $default,){
final _that = this;
switch (_that) {
case _Property():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Property value)?  $default,){
final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'property_type')  String propertyType, @JsonKey(name: 'transaction_type')  String transactionType,  int price,  int area,  String city,  String district,  int bedrooms, @JsonKey(name: 'year_built')  int yearBuilt,  int floor, @JsonKey(name: 'total_floors')  int totalFloors, @JsonKey(name: 'document_type')  String? documentType, @JsonKey(name: 'has_parking')  bool hasParking, @JsonKey(name: 'has_elevator')  bool hasElevator, @JsonKey(name: 'has_storage')  bool hasStorage, @JsonKey(name: 'is_renovated')  bool isRenovated, @JsonKey(name: 'open_to_exchange')  bool openToExchange, @JsonKey(name: 'exchange_preferences')  List<String>? exchangePreferences, @JsonKey(name: 'owner_phone')  String ownerPhone,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.id,_that.title,_that.propertyType,_that.transactionType,_that.price,_that.area,_that.city,_that.district,_that.bedrooms,_that.yearBuilt,_that.floor,_that.totalFloors,_that.documentType,_that.hasParking,_that.hasElevator,_that.hasStorage,_that.isRenovated,_that.openToExchange,_that.exchangePreferences,_that.ownerPhone,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'property_type')  String propertyType, @JsonKey(name: 'transaction_type')  String transactionType,  int price,  int area,  String city,  String district,  int bedrooms, @JsonKey(name: 'year_built')  int yearBuilt,  int floor, @JsonKey(name: 'total_floors')  int totalFloors, @JsonKey(name: 'document_type')  String? documentType, @JsonKey(name: 'has_parking')  bool hasParking, @JsonKey(name: 'has_elevator')  bool hasElevator, @JsonKey(name: 'has_storage')  bool hasStorage, @JsonKey(name: 'is_renovated')  bool isRenovated, @JsonKey(name: 'open_to_exchange')  bool openToExchange, @JsonKey(name: 'exchange_preferences')  List<String>? exchangePreferences, @JsonKey(name: 'owner_phone')  String ownerPhone,  String description)  $default,) {final _that = this;
switch (_that) {
case _Property():
return $default(_that.id,_that.title,_that.propertyType,_that.transactionType,_that.price,_that.area,_that.city,_that.district,_that.bedrooms,_that.yearBuilt,_that.floor,_that.totalFloors,_that.documentType,_that.hasParking,_that.hasElevator,_that.hasStorage,_that.isRenovated,_that.openToExchange,_that.exchangePreferences,_that.ownerPhone,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'property_type')  String propertyType, @JsonKey(name: 'transaction_type')  String transactionType,  int price,  int area,  String city,  String district,  int bedrooms, @JsonKey(name: 'year_built')  int yearBuilt,  int floor, @JsonKey(name: 'total_floors')  int totalFloors, @JsonKey(name: 'document_type')  String? documentType, @JsonKey(name: 'has_parking')  bool hasParking, @JsonKey(name: 'has_elevator')  bool hasElevator, @JsonKey(name: 'has_storage')  bool hasStorage, @JsonKey(name: 'is_renovated')  bool isRenovated, @JsonKey(name: 'open_to_exchange')  bool openToExchange, @JsonKey(name: 'exchange_preferences')  List<String>? exchangePreferences, @JsonKey(name: 'owner_phone')  String ownerPhone,  String description)?  $default,) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.id,_that.title,_that.propertyType,_that.transactionType,_that.price,_that.area,_that.city,_that.district,_that.bedrooms,_that.yearBuilt,_that.floor,_that.totalFloors,_that.documentType,_that.hasParking,_that.hasElevator,_that.hasStorage,_that.isRenovated,_that.openToExchange,_that.exchangePreferences,_that.ownerPhone,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Property implements Property {
  const _Property({required this.id, required this.title, @JsonKey(name: 'property_type') required this.propertyType, @JsonKey(name: 'transaction_type') required this.transactionType, required this.price, required this.area, required this.city, required this.district, required this.bedrooms, @JsonKey(name: 'year_built') required this.yearBuilt, required this.floor, @JsonKey(name: 'total_floors') required this.totalFloors, @JsonKey(name: 'document_type') this.documentType, @JsonKey(name: 'has_parking') required this.hasParking, @JsonKey(name: 'has_elevator') required this.hasElevator, @JsonKey(name: 'has_storage') required this.hasStorage, @JsonKey(name: 'is_renovated') required this.isRenovated, @JsonKey(name: 'open_to_exchange') required this.openToExchange, @JsonKey(name: 'exchange_preferences') final  List<String>? exchangePreferences, @JsonKey(name: 'owner_phone') required this.ownerPhone, required this.description}): _exchangePreferences = exchangePreferences;
  factory _Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'property_type') final  String propertyType;
@override@JsonKey(name: 'transaction_type') final  String transactionType;
@override final  int price;
@override final  int area;
@override final  String city;
@override final  String district;
@override final  int bedrooms;
@override@JsonKey(name: 'year_built') final  int yearBuilt;
@override final  int floor;
@override@JsonKey(name: 'total_floors') final  int totalFloors;
@override@JsonKey(name: 'document_type') final  String? documentType;
@override@JsonKey(name: 'has_parking') final  bool hasParking;
@override@JsonKey(name: 'has_elevator') final  bool hasElevator;
@override@JsonKey(name: 'has_storage') final  bool hasStorage;
@override@JsonKey(name: 'is_renovated') final  bool isRenovated;
@override@JsonKey(name: 'open_to_exchange') final  bool openToExchange;
 final  List<String>? _exchangePreferences;
@override@JsonKey(name: 'exchange_preferences') List<String>? get exchangePreferences {
  final value = _exchangePreferences;
  if (value == null) return null;
  if (_exchangePreferences is EqualUnmodifiableListView) return _exchangePreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'owner_phone') final  String ownerPhone;
@override final  String description;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyCopyWith<_Property> get copyWith => __$PropertyCopyWithImpl<_Property>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Property&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.propertyType, propertyType) || other.propertyType == propertyType)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.price, price) || other.price == price)&&(identical(other.area, area) || other.area == area)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.yearBuilt, yearBuilt) || other.yearBuilt == yearBuilt)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.totalFloors, totalFloors) || other.totalFloors == totalFloors)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.hasParking, hasParking) || other.hasParking == hasParking)&&(identical(other.hasElevator, hasElevator) || other.hasElevator == hasElevator)&&(identical(other.hasStorage, hasStorage) || other.hasStorage == hasStorage)&&(identical(other.isRenovated, isRenovated) || other.isRenovated == isRenovated)&&(identical(other.openToExchange, openToExchange) || other.openToExchange == openToExchange)&&const DeepCollectionEquality().equals(other._exchangePreferences, _exchangePreferences)&&(identical(other.ownerPhone, ownerPhone) || other.ownerPhone == ownerPhone)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,propertyType,transactionType,price,area,city,district,bedrooms,yearBuilt,floor,totalFloors,documentType,hasParking,hasElevator,hasStorage,isRenovated,openToExchange,const DeepCollectionEquality().hash(_exchangePreferences),ownerPhone,description]);

@override
String toString() {
  return 'Property(id: $id, title: $title, propertyType: $propertyType, transactionType: $transactionType, price: $price, area: $area, city: $city, district: $district, bedrooms: $bedrooms, yearBuilt: $yearBuilt, floor: $floor, totalFloors: $totalFloors, documentType: $documentType, hasParking: $hasParking, hasElevator: $hasElevator, hasStorage: $hasStorage, isRenovated: $isRenovated, openToExchange: $openToExchange, exchangePreferences: $exchangePreferences, ownerPhone: $ownerPhone, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PropertyCopyWith<$Res> implements $PropertyCopyWith<$Res> {
  factory _$PropertyCopyWith(_Property value, $Res Function(_Property) _then) = __$PropertyCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'property_type') String propertyType,@JsonKey(name: 'transaction_type') String transactionType, int price, int area, String city, String district, int bedrooms,@JsonKey(name: 'year_built') int yearBuilt, int floor,@JsonKey(name: 'total_floors') int totalFloors,@JsonKey(name: 'document_type') String? documentType,@JsonKey(name: 'has_parking') bool hasParking,@JsonKey(name: 'has_elevator') bool hasElevator,@JsonKey(name: 'has_storage') bool hasStorage,@JsonKey(name: 'is_renovated') bool isRenovated,@JsonKey(name: 'open_to_exchange') bool openToExchange,@JsonKey(name: 'exchange_preferences') List<String>? exchangePreferences,@JsonKey(name: 'owner_phone') String ownerPhone, String description
});




}
/// @nodoc
class __$PropertyCopyWithImpl<$Res>
    implements _$PropertyCopyWith<$Res> {
  __$PropertyCopyWithImpl(this._self, this._then);

  final _Property _self;
  final $Res Function(_Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? propertyType = null,Object? transactionType = null,Object? price = null,Object? area = null,Object? city = null,Object? district = null,Object? bedrooms = null,Object? yearBuilt = null,Object? floor = null,Object? totalFloors = null,Object? documentType = freezed,Object? hasParking = null,Object? hasElevator = null,Object? hasStorage = null,Object? isRenovated = null,Object? openToExchange = null,Object? exchangePreferences = freezed,Object? ownerPhone = null,Object? description = null,}) {
  return _then(_Property(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,propertyType: null == propertyType ? _self.propertyType : propertyType // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,yearBuilt: null == yearBuilt ? _self.yearBuilt : yearBuilt // ignore: cast_nullable_to_non_nullable
as int,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,totalFloors: null == totalFloors ? _self.totalFloors : totalFloors // ignore: cast_nullable_to_non_nullable
as int,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String?,hasParking: null == hasParking ? _self.hasParking : hasParking // ignore: cast_nullable_to_non_nullable
as bool,hasElevator: null == hasElevator ? _self.hasElevator : hasElevator // ignore: cast_nullable_to_non_nullable
as bool,hasStorage: null == hasStorage ? _self.hasStorage : hasStorage // ignore: cast_nullable_to_non_nullable
as bool,isRenovated: null == isRenovated ? _self.isRenovated : isRenovated // ignore: cast_nullable_to_non_nullable
as bool,openToExchange: null == openToExchange ? _self.openToExchange : openToExchange // ignore: cast_nullable_to_non_nullable
as bool,exchangePreferences: freezed == exchangePreferences ? _self._exchangePreferences : exchangePreferences // ignore: cast_nullable_to_non_nullable
as List<String>?,ownerPhone: null == ownerPhone ? _self.ownerPhone : ownerPhone // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
