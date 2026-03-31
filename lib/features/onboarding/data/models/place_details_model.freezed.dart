// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceDetailsModel {

@JsonKey(name: 'address_components') List<AddressComponentModel> get addressComponents;@JsonKey(name: 'formatted_address') String get formattedAddress;
/// Create a copy of PlaceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceDetailsModelCopyWith<PlaceDetailsModel> get copyWith => _$PlaceDetailsModelCopyWithImpl<PlaceDetailsModel>(this as PlaceDetailsModel, _$identity);

  /// Serializes this PlaceDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceDetailsModel&&const DeepCollectionEquality().equals(other.addressComponents, addressComponents)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(addressComponents),formattedAddress);

@override
String toString() {
  return 'PlaceDetailsModel(addressComponents: $addressComponents, formattedAddress: $formattedAddress)';
}


}

/// @nodoc
abstract mixin class $PlaceDetailsModelCopyWith<$Res>  {
  factory $PlaceDetailsModelCopyWith(PlaceDetailsModel value, $Res Function(PlaceDetailsModel) _then) = _$PlaceDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'address_components') List<AddressComponentModel> addressComponents,@JsonKey(name: 'formatted_address') String formattedAddress
});




}
/// @nodoc
class _$PlaceDetailsModelCopyWithImpl<$Res>
    implements $PlaceDetailsModelCopyWith<$Res> {
  _$PlaceDetailsModelCopyWithImpl(this._self, this._then);

  final PlaceDetailsModel _self;
  final $Res Function(PlaceDetailsModel) _then;

/// Create a copy of PlaceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addressComponents = null,Object? formattedAddress = null,}) {
  return _then(_self.copyWith(
addressComponents: null == addressComponents ? _self.addressComponents : addressComponents // ignore: cast_nullable_to_non_nullable
as List<AddressComponentModel>,formattedAddress: null == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceDetailsModel].
extension PlaceDetailsModelPatterns on PlaceDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _PlaceDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'address_components')  List<AddressComponentModel> addressComponents, @JsonKey(name: 'formatted_address')  String formattedAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceDetailsModel() when $default != null:
return $default(_that.addressComponents,_that.formattedAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'address_components')  List<AddressComponentModel> addressComponents, @JsonKey(name: 'formatted_address')  String formattedAddress)  $default,) {final _that = this;
switch (_that) {
case _PlaceDetailsModel():
return $default(_that.addressComponents,_that.formattedAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'address_components')  List<AddressComponentModel> addressComponents, @JsonKey(name: 'formatted_address')  String formattedAddress)?  $default,) {final _that = this;
switch (_that) {
case _PlaceDetailsModel() when $default != null:
return $default(_that.addressComponents,_that.formattedAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceDetailsModel implements PlaceDetailsModel {
  const _PlaceDetailsModel({@JsonKey(name: 'address_components') required final  List<AddressComponentModel> addressComponents, @JsonKey(name: 'formatted_address') required this.formattedAddress}): _addressComponents = addressComponents;
  factory _PlaceDetailsModel.fromJson(Map<String, dynamic> json) => _$PlaceDetailsModelFromJson(json);

 final  List<AddressComponentModel> _addressComponents;
@override@JsonKey(name: 'address_components') List<AddressComponentModel> get addressComponents {
  if (_addressComponents is EqualUnmodifiableListView) return _addressComponents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addressComponents);
}

@override@JsonKey(name: 'formatted_address') final  String formattedAddress;

/// Create a copy of PlaceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceDetailsModelCopyWith<_PlaceDetailsModel> get copyWith => __$PlaceDetailsModelCopyWithImpl<_PlaceDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceDetailsModel&&const DeepCollectionEquality().equals(other._addressComponents, _addressComponents)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addressComponents),formattedAddress);

@override
String toString() {
  return 'PlaceDetailsModel(addressComponents: $addressComponents, formattedAddress: $formattedAddress)';
}


}

/// @nodoc
abstract mixin class _$PlaceDetailsModelCopyWith<$Res> implements $PlaceDetailsModelCopyWith<$Res> {
  factory _$PlaceDetailsModelCopyWith(_PlaceDetailsModel value, $Res Function(_PlaceDetailsModel) _then) = __$PlaceDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'address_components') List<AddressComponentModel> addressComponents,@JsonKey(name: 'formatted_address') String formattedAddress
});




}
/// @nodoc
class __$PlaceDetailsModelCopyWithImpl<$Res>
    implements _$PlaceDetailsModelCopyWith<$Res> {
  __$PlaceDetailsModelCopyWithImpl(this._self, this._then);

  final _PlaceDetailsModel _self;
  final $Res Function(_PlaceDetailsModel) _then;

/// Create a copy of PlaceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addressComponents = null,Object? formattedAddress = null,}) {
  return _then(_PlaceDetailsModel(
addressComponents: null == addressComponents ? _self._addressComponents : addressComponents // ignore: cast_nullable_to_non_nullable
as List<AddressComponentModel>,formattedAddress: null == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AddressComponentModel {

@JsonKey(name: 'long_name') String get longName;@JsonKey(name: 'short_name') String get shortName; List<String> get types;
/// Create a copy of AddressComponentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressComponentModelCopyWith<AddressComponentModel> get copyWith => _$AddressComponentModelCopyWithImpl<AddressComponentModel>(this as AddressComponentModel, _$identity);

  /// Serializes this AddressComponentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressComponentModel&&(identical(other.longName, longName) || other.longName == longName)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&const DeepCollectionEquality().equals(other.types, types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longName,shortName,const DeepCollectionEquality().hash(types));

@override
String toString() {
  return 'AddressComponentModel(longName: $longName, shortName: $shortName, types: $types)';
}


}

/// @nodoc
abstract mixin class $AddressComponentModelCopyWith<$Res>  {
  factory $AddressComponentModelCopyWith(AddressComponentModel value, $Res Function(AddressComponentModel) _then) = _$AddressComponentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'long_name') String longName,@JsonKey(name: 'short_name') String shortName, List<String> types
});




}
/// @nodoc
class _$AddressComponentModelCopyWithImpl<$Res>
    implements $AddressComponentModelCopyWith<$Res> {
  _$AddressComponentModelCopyWithImpl(this._self, this._then);

  final AddressComponentModel _self;
  final $Res Function(AddressComponentModel) _then;

/// Create a copy of AddressComponentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? longName = null,Object? shortName = null,Object? types = null,}) {
  return _then(_self.copyWith(
longName: null == longName ? _self.longName : longName // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressComponentModel].
extension AddressComponentModelPatterns on AddressComponentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressComponentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressComponentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressComponentModel value)  $default,){
final _that = this;
switch (_that) {
case _AddressComponentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressComponentModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddressComponentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'long_name')  String longName, @JsonKey(name: 'short_name')  String shortName,  List<String> types)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressComponentModel() when $default != null:
return $default(_that.longName,_that.shortName,_that.types);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'long_name')  String longName, @JsonKey(name: 'short_name')  String shortName,  List<String> types)  $default,) {final _that = this;
switch (_that) {
case _AddressComponentModel():
return $default(_that.longName,_that.shortName,_that.types);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'long_name')  String longName, @JsonKey(name: 'short_name')  String shortName,  List<String> types)?  $default,) {final _that = this;
switch (_that) {
case _AddressComponentModel() when $default != null:
return $default(_that.longName,_that.shortName,_that.types);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressComponentModel implements AddressComponentModel {
  const _AddressComponentModel({@JsonKey(name: 'long_name') required this.longName, @JsonKey(name: 'short_name') required this.shortName, required final  List<String> types}): _types = types;
  factory _AddressComponentModel.fromJson(Map<String, dynamic> json) => _$AddressComponentModelFromJson(json);

@override@JsonKey(name: 'long_name') final  String longName;
@override@JsonKey(name: 'short_name') final  String shortName;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}


/// Create a copy of AddressComponentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressComponentModelCopyWith<_AddressComponentModel> get copyWith => __$AddressComponentModelCopyWithImpl<_AddressComponentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressComponentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressComponentModel&&(identical(other.longName, longName) || other.longName == longName)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&const DeepCollectionEquality().equals(other._types, _types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longName,shortName,const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'AddressComponentModel(longName: $longName, shortName: $shortName, types: $types)';
}


}

/// @nodoc
abstract mixin class _$AddressComponentModelCopyWith<$Res> implements $AddressComponentModelCopyWith<$Res> {
  factory _$AddressComponentModelCopyWith(_AddressComponentModel value, $Res Function(_AddressComponentModel) _then) = __$AddressComponentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'long_name') String longName,@JsonKey(name: 'short_name') String shortName, List<String> types
});




}
/// @nodoc
class __$AddressComponentModelCopyWithImpl<$Res>
    implements _$AddressComponentModelCopyWith<$Res> {
  __$AddressComponentModelCopyWithImpl(this._self, this._then);

  final _AddressComponentModel _self;
  final $Res Function(_AddressComponentModel) _then;

/// Create a copy of AddressComponentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? longName = null,Object? shortName = null,Object? types = null,}) {
  return _then(_AddressComponentModel(
longName: null == longName ? _self.longName : longName // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
