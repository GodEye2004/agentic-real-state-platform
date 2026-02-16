// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_talk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgentTalkResponse {

 String get response;@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'requires_input') bool get requiresInput;@JsonKey(name: 'missing_fields') List<String> get missingFields;@JsonKey(name: 'recommended_properties') List<AgentTalkProperty> get recommendedProperties; String get state;
/// Create a copy of AgentTalkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentTalkResponseCopyWith<AgentTalkResponse> get copyWith => _$AgentTalkResponseCopyWithImpl<AgentTalkResponse>(this as AgentTalkResponse, _$identity);

  /// Serializes this AgentTalkResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentTalkResponse&&(identical(other.response, response) || other.response == response)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.requiresInput, requiresInput) || other.requiresInput == requiresInput)&&const DeepCollectionEquality().equals(other.missingFields, missingFields)&&const DeepCollectionEquality().equals(other.recommendedProperties, recommendedProperties)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,sessionId,requiresInput,const DeepCollectionEquality().hash(missingFields),const DeepCollectionEquality().hash(recommendedProperties),state);

@override
String toString() {
  return 'AgentTalkResponse(response: $response, sessionId: $sessionId, requiresInput: $requiresInput, missingFields: $missingFields, recommendedProperties: $recommendedProperties, state: $state)';
}


}

/// @nodoc
abstract mixin class $AgentTalkResponseCopyWith<$Res>  {
  factory $AgentTalkResponseCopyWith(AgentTalkResponse value, $Res Function(AgentTalkResponse) _then) = _$AgentTalkResponseCopyWithImpl;
@useResult
$Res call({
 String response,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'requires_input') bool requiresInput,@JsonKey(name: 'missing_fields') List<String> missingFields,@JsonKey(name: 'recommended_properties') List<AgentTalkProperty> recommendedProperties, String state
});




}
/// @nodoc
class _$AgentTalkResponseCopyWithImpl<$Res>
    implements $AgentTalkResponseCopyWith<$Res> {
  _$AgentTalkResponseCopyWithImpl(this._self, this._then);

  final AgentTalkResponse _self;
  final $Res Function(AgentTalkResponse) _then;

/// Create a copy of AgentTalkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = null,Object? sessionId = null,Object? requiresInput = null,Object? missingFields = null,Object? recommendedProperties = null,Object? state = null,}) {
  return _then(_self.copyWith(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,requiresInput: null == requiresInput ? _self.requiresInput : requiresInput // ignore: cast_nullable_to_non_nullable
as bool,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,recommendedProperties: null == recommendedProperties ? _self.recommendedProperties : recommendedProperties // ignore: cast_nullable_to_non_nullable
as List<AgentTalkProperty>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentTalkResponse].
extension AgentTalkResponsePatterns on AgentTalkResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentTalkResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentTalkResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentTalkResponse value)  $default,){
final _that = this;
switch (_that) {
case _AgentTalkResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentTalkResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AgentTalkResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String response, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'requires_input')  bool requiresInput, @JsonKey(name: 'missing_fields')  List<String> missingFields, @JsonKey(name: 'recommended_properties')  List<AgentTalkProperty> recommendedProperties,  String state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentTalkResponse() when $default != null:
return $default(_that.response,_that.sessionId,_that.requiresInput,_that.missingFields,_that.recommendedProperties,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String response, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'requires_input')  bool requiresInput, @JsonKey(name: 'missing_fields')  List<String> missingFields, @JsonKey(name: 'recommended_properties')  List<AgentTalkProperty> recommendedProperties,  String state)  $default,) {final _that = this;
switch (_that) {
case _AgentTalkResponse():
return $default(_that.response,_that.sessionId,_that.requiresInput,_that.missingFields,_that.recommendedProperties,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String response, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'requires_input')  bool requiresInput, @JsonKey(name: 'missing_fields')  List<String> missingFields, @JsonKey(name: 'recommended_properties')  List<AgentTalkProperty> recommendedProperties,  String state)?  $default,) {final _that = this;
switch (_that) {
case _AgentTalkResponse() when $default != null:
return $default(_that.response,_that.sessionId,_that.requiresInput,_that.missingFields,_that.recommendedProperties,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentTalkResponse implements AgentTalkResponse {
  const _AgentTalkResponse({required this.response, @JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'requires_input') this.requiresInput = false, @JsonKey(name: 'missing_fields') final  List<String> missingFields = const [], @JsonKey(name: 'recommended_properties') final  List<AgentTalkProperty> recommendedProperties = const [], required this.state}): _missingFields = missingFields,_recommendedProperties = recommendedProperties;
  factory _AgentTalkResponse.fromJson(Map<String, dynamic> json) => _$AgentTalkResponseFromJson(json);

@override final  String response;
@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'requires_input') final  bool requiresInput;
 final  List<String> _missingFields;
@override@JsonKey(name: 'missing_fields') List<String> get missingFields {
  if (_missingFields is EqualUnmodifiableListView) return _missingFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingFields);
}

 final  List<AgentTalkProperty> _recommendedProperties;
@override@JsonKey(name: 'recommended_properties') List<AgentTalkProperty> get recommendedProperties {
  if (_recommendedProperties is EqualUnmodifiableListView) return _recommendedProperties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedProperties);
}

@override final  String state;

/// Create a copy of AgentTalkResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentTalkResponseCopyWith<_AgentTalkResponse> get copyWith => __$AgentTalkResponseCopyWithImpl<_AgentTalkResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentTalkResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentTalkResponse&&(identical(other.response, response) || other.response == response)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.requiresInput, requiresInput) || other.requiresInput == requiresInput)&&const DeepCollectionEquality().equals(other._missingFields, _missingFields)&&const DeepCollectionEquality().equals(other._recommendedProperties, _recommendedProperties)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,sessionId,requiresInput,const DeepCollectionEquality().hash(_missingFields),const DeepCollectionEquality().hash(_recommendedProperties),state);

@override
String toString() {
  return 'AgentTalkResponse(response: $response, sessionId: $sessionId, requiresInput: $requiresInput, missingFields: $missingFields, recommendedProperties: $recommendedProperties, state: $state)';
}


}

/// @nodoc
abstract mixin class _$AgentTalkResponseCopyWith<$Res> implements $AgentTalkResponseCopyWith<$Res> {
  factory _$AgentTalkResponseCopyWith(_AgentTalkResponse value, $Res Function(_AgentTalkResponse) _then) = __$AgentTalkResponseCopyWithImpl;
@override @useResult
$Res call({
 String response,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'requires_input') bool requiresInput,@JsonKey(name: 'missing_fields') List<String> missingFields,@JsonKey(name: 'recommended_properties') List<AgentTalkProperty> recommendedProperties, String state
});




}
/// @nodoc
class __$AgentTalkResponseCopyWithImpl<$Res>
    implements _$AgentTalkResponseCopyWith<$Res> {
  __$AgentTalkResponseCopyWithImpl(this._self, this._then);

  final _AgentTalkResponse _self;
  final $Res Function(_AgentTalkResponse) _then;

/// Create a copy of AgentTalkResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,Object? sessionId = null,Object? requiresInput = null,Object? missingFields = null,Object? recommendedProperties = null,Object? state = null,}) {
  return _then(_AgentTalkResponse(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,requiresInput: null == requiresInput ? _self.requiresInput : requiresInput // ignore: cast_nullable_to_non_nullable
as bool,missingFields: null == missingFields ? _self._missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,recommendedProperties: null == recommendedProperties ? _self._recommendedProperties : recommendedProperties // ignore: cast_nullable_to_non_nullable
as List<AgentTalkProperty>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AgentTalkProperty {

 String get id; String get title; double get price; double get area; double get vpm; int? get units; String get location;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'source_link') String? get sourceLink; String get description;@JsonKey(name: 'match_percentage') double get matchPercentage; double get score;
/// Create a copy of AgentTalkProperty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentTalkPropertyCopyWith<AgentTalkProperty> get copyWith => _$AgentTalkPropertyCopyWithImpl<AgentTalkProperty>(this as AgentTalkProperty, _$identity);

  /// Serializes this AgentTalkProperty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentTalkProperty&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.area, area) || other.area == area)&&(identical(other.vpm, vpm) || other.vpm == vpm)&&(identical(other.units, units) || other.units == units)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sourceLink, sourceLink) || other.sourceLink == sourceLink)&&(identical(other.description, description) || other.description == description)&&(identical(other.matchPercentage, matchPercentage) || other.matchPercentage == matchPercentage)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,area,vpm,units,location,imageUrl,sourceLink,description,matchPercentage,score);

@override
String toString() {
  return 'AgentTalkProperty(id: $id, title: $title, price: $price, area: $area, vpm: $vpm, units: $units, location: $location, imageUrl: $imageUrl, sourceLink: $sourceLink, description: $description, matchPercentage: $matchPercentage, score: $score)';
}


}

/// @nodoc
abstract mixin class $AgentTalkPropertyCopyWith<$Res>  {
  factory $AgentTalkPropertyCopyWith(AgentTalkProperty value, $Res Function(AgentTalkProperty) _then) = _$AgentTalkPropertyCopyWithImpl;
@useResult
$Res call({
 String id, String title, double price, double area, double vpm, int? units, String location,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'source_link') String? sourceLink, String description,@JsonKey(name: 'match_percentage') double matchPercentage, double score
});




}
/// @nodoc
class _$AgentTalkPropertyCopyWithImpl<$Res>
    implements $AgentTalkPropertyCopyWith<$Res> {
  _$AgentTalkPropertyCopyWithImpl(this._self, this._then);

  final AgentTalkProperty _self;
  final $Res Function(AgentTalkProperty) _then;

/// Create a copy of AgentTalkProperty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,Object? area = null,Object? vpm = null,Object? units = freezed,Object? location = null,Object? imageUrl = freezed,Object? sourceLink = freezed,Object? description = null,Object? matchPercentage = null,Object? score = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,vpm: null == vpm ? _self.vpm : vpm // ignore: cast_nullable_to_non_nullable
as double,units: freezed == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceLink: freezed == sourceLink ? _self.sourceLink : sourceLink // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,matchPercentage: null == matchPercentage ? _self.matchPercentage : matchPercentage // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentTalkProperty].
extension AgentTalkPropertyPatterns on AgentTalkProperty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentTalkProperty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentTalkProperty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentTalkProperty value)  $default,){
final _that = this;
switch (_that) {
case _AgentTalkProperty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentTalkProperty value)?  $default,){
final _that = this;
switch (_that) {
case _AgentTalkProperty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  double price,  double area,  double vpm,  int? units,  String location, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'source_link')  String? sourceLink,  String description, @JsonKey(name: 'match_percentage')  double matchPercentage,  double score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentTalkProperty() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.area,_that.vpm,_that.units,_that.location,_that.imageUrl,_that.sourceLink,_that.description,_that.matchPercentage,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  double price,  double area,  double vpm,  int? units,  String location, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'source_link')  String? sourceLink,  String description, @JsonKey(name: 'match_percentage')  double matchPercentage,  double score)  $default,) {final _that = this;
switch (_that) {
case _AgentTalkProperty():
return $default(_that.id,_that.title,_that.price,_that.area,_that.vpm,_that.units,_that.location,_that.imageUrl,_that.sourceLink,_that.description,_that.matchPercentage,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  double price,  double area,  double vpm,  int? units,  String location, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'source_link')  String? sourceLink,  String description, @JsonKey(name: 'match_percentage')  double matchPercentage,  double score)?  $default,) {final _that = this;
switch (_that) {
case _AgentTalkProperty() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.area,_that.vpm,_that.units,_that.location,_that.imageUrl,_that.sourceLink,_that.description,_that.matchPercentage,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentTalkProperty implements AgentTalkProperty {
  const _AgentTalkProperty({required this.id, required this.title, required this.price, required this.area, required this.vpm, this.units, required this.location, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'source_link') this.sourceLink, required this.description, @JsonKey(name: 'match_percentage') required this.matchPercentage, required this.score});
  factory _AgentTalkProperty.fromJson(Map<String, dynamic> json) => _$AgentTalkPropertyFromJson(json);

@override final  String id;
@override final  String title;
@override final  double price;
@override final  double area;
@override final  double vpm;
@override final  int? units;
@override final  String location;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'source_link') final  String? sourceLink;
@override final  String description;
@override@JsonKey(name: 'match_percentage') final  double matchPercentage;
@override final  double score;

/// Create a copy of AgentTalkProperty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentTalkPropertyCopyWith<_AgentTalkProperty> get copyWith => __$AgentTalkPropertyCopyWithImpl<_AgentTalkProperty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentTalkPropertyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentTalkProperty&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.area, area) || other.area == area)&&(identical(other.vpm, vpm) || other.vpm == vpm)&&(identical(other.units, units) || other.units == units)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sourceLink, sourceLink) || other.sourceLink == sourceLink)&&(identical(other.description, description) || other.description == description)&&(identical(other.matchPercentage, matchPercentage) || other.matchPercentage == matchPercentage)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,area,vpm,units,location,imageUrl,sourceLink,description,matchPercentage,score);

@override
String toString() {
  return 'AgentTalkProperty(id: $id, title: $title, price: $price, area: $area, vpm: $vpm, units: $units, location: $location, imageUrl: $imageUrl, sourceLink: $sourceLink, description: $description, matchPercentage: $matchPercentage, score: $score)';
}


}

/// @nodoc
abstract mixin class _$AgentTalkPropertyCopyWith<$Res> implements $AgentTalkPropertyCopyWith<$Res> {
  factory _$AgentTalkPropertyCopyWith(_AgentTalkProperty value, $Res Function(_AgentTalkProperty) _then) = __$AgentTalkPropertyCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double price, double area, double vpm, int? units, String location,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'source_link') String? sourceLink, String description,@JsonKey(name: 'match_percentage') double matchPercentage, double score
});




}
/// @nodoc
class __$AgentTalkPropertyCopyWithImpl<$Res>
    implements _$AgentTalkPropertyCopyWith<$Res> {
  __$AgentTalkPropertyCopyWithImpl(this._self, this._then);

  final _AgentTalkProperty _self;
  final $Res Function(_AgentTalkProperty) _then;

/// Create a copy of AgentTalkProperty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? price = null,Object? area = null,Object? vpm = null,Object? units = freezed,Object? location = null,Object? imageUrl = freezed,Object? sourceLink = freezed,Object? description = null,Object? matchPercentage = null,Object? score = null,}) {
  return _then(_AgentTalkProperty(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,vpm: null == vpm ? _self.vpm : vpm // ignore: cast_nullable_to_non_nullable
as double,units: freezed == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceLink: freezed == sourceLink ? _self.sourceLink : sourceLink // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,matchPercentage: null == matchPercentage ? _self.matchPercentage : matchPercentage // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
