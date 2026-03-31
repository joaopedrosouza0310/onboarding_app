// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

// ── Navigation ──────────────────────────────────────────
 int get currentStep;// ── Step 1: Full legal name ──────────────────────────────
 String get fullName;// ── Step 2: Date of birth ────────────────────────────────
 DateTime? get dateOfBirth;// ── Step 3: Residential address ──────────────────────────
 String get streetAddress; String get city; String get addressState; String get postalCode; String get country;// Address autocomplete
 List<AddressSuggestionEntity> get addressSuggestions; bool get isLoadingAddressSuggestions; String? get addressSuggestionsError; bool get isAddressAutocompleteAvailable;// ── Async / error flags ──────────────────────────────────
 bool get isSubmitting; bool get isSubmitted; bool get isError; String? get errorMessage;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressState, addressState) || other.addressState == addressState)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.addressSuggestions, addressSuggestions)&&(identical(other.isLoadingAddressSuggestions, isLoadingAddressSuggestions) || other.isLoadingAddressSuggestions == isLoadingAddressSuggestions)&&(identical(other.addressSuggestionsError, addressSuggestionsError) || other.addressSuggestionsError == addressSuggestionsError)&&(identical(other.isAddressAutocompleteAvailable, isAddressAutocompleteAvailable) || other.isAddressAutocompleteAvailable == isAddressAutocompleteAvailable)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,fullName,dateOfBirth,streetAddress,city,addressState,postalCode,country,const DeepCollectionEquality().hash(addressSuggestions),isLoadingAddressSuggestions,addressSuggestionsError,isAddressAutocompleteAvailable,isSubmitting,isSubmitted,isError,errorMessage);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, fullName: $fullName, dateOfBirth: $dateOfBirth, streetAddress: $streetAddress, city: $city, addressState: $addressState, postalCode: $postalCode, country: $country, addressSuggestions: $addressSuggestions, isLoadingAddressSuggestions: $isLoadingAddressSuggestions, addressSuggestionsError: $addressSuggestionsError, isAddressAutocompleteAvailable: $isAddressAutocompleteAvailable, isSubmitting: $isSubmitting, isSubmitted: $isSubmitted, isError: $isError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, String fullName, DateTime? dateOfBirth, String streetAddress, String city, String addressState, String postalCode, String country, List<AddressSuggestionEntity> addressSuggestions, bool isLoadingAddressSuggestions, String? addressSuggestionsError, bool isAddressAutocompleteAvailable, bool isSubmitting, bool isSubmitted, bool isError, String? errorMessage
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? streetAddress = null,Object? city = null,Object? addressState = null,Object? postalCode = null,Object? country = null,Object? addressSuggestions = null,Object? isLoadingAddressSuggestions = null,Object? addressSuggestionsError = freezed,Object? isAddressAutocompleteAvailable = null,Object? isSubmitting = null,Object? isSubmitted = null,Object? isError = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,addressState: null == addressState ? _self.addressState : addressState // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,addressSuggestions: null == addressSuggestions ? _self.addressSuggestions : addressSuggestions // ignore: cast_nullable_to_non_nullable
as List<AddressSuggestionEntity>,isLoadingAddressSuggestions: null == isLoadingAddressSuggestions ? _self.isLoadingAddressSuggestions : isLoadingAddressSuggestions // ignore: cast_nullable_to_non_nullable
as bool,addressSuggestionsError: freezed == addressSuggestionsError ? _self.addressSuggestionsError : addressSuggestionsError // ignore: cast_nullable_to_non_nullable
as String?,isAddressAutocompleteAvailable: null == isAddressAutocompleteAvailable ? _self.isAddressAutocompleteAvailable : isAddressAutocompleteAvailable // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  String fullName,  DateTime? dateOfBirth,  String streetAddress,  String city,  String addressState,  String postalCode,  String country,  List<AddressSuggestionEntity> addressSuggestions,  bool isLoadingAddressSuggestions,  String? addressSuggestionsError,  bool isAddressAutocompleteAvailable,  bool isSubmitting,  bool isSubmitted,  bool isError,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.fullName,_that.dateOfBirth,_that.streetAddress,_that.city,_that.addressState,_that.postalCode,_that.country,_that.addressSuggestions,_that.isLoadingAddressSuggestions,_that.addressSuggestionsError,_that.isAddressAutocompleteAvailable,_that.isSubmitting,_that.isSubmitted,_that.isError,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  String fullName,  DateTime? dateOfBirth,  String streetAddress,  String city,  String addressState,  String postalCode,  String country,  List<AddressSuggestionEntity> addressSuggestions,  bool isLoadingAddressSuggestions,  String? addressSuggestionsError,  bool isAddressAutocompleteAvailable,  bool isSubmitting,  bool isSubmitted,  bool isError,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.currentStep,_that.fullName,_that.dateOfBirth,_that.streetAddress,_that.city,_that.addressState,_that.postalCode,_that.country,_that.addressSuggestions,_that.isLoadingAddressSuggestions,_that.addressSuggestionsError,_that.isAddressAutocompleteAvailable,_that.isSubmitting,_that.isSubmitted,_that.isError,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  String fullName,  DateTime? dateOfBirth,  String streetAddress,  String city,  String addressState,  String postalCode,  String country,  List<AddressSuggestionEntity> addressSuggestions,  bool isLoadingAddressSuggestions,  String? addressSuggestionsError,  bool isAddressAutocompleteAvailable,  bool isSubmitting,  bool isSubmitted,  bool isError,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.fullName,_that.dateOfBirth,_that.streetAddress,_that.city,_that.addressState,_that.postalCode,_that.country,_that.addressSuggestions,_that.isLoadingAddressSuggestions,_that.addressSuggestionsError,_that.isAddressAutocompleteAvailable,_that.isSubmitting,_that.isSubmitted,_that.isError,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.currentStep = 0, this.fullName = '', this.dateOfBirth, this.streetAddress = '', this.city = '', this.addressState = '', this.postalCode = '', this.country = '', final  List<AddressSuggestionEntity> addressSuggestions = const <AddressSuggestionEntity>[], this.isLoadingAddressSuggestions = false, this.addressSuggestionsError, this.isAddressAutocompleteAvailable = true, this.isSubmitting = false, this.isSubmitted = false, this.isError = false, this.errorMessage}): _addressSuggestions = addressSuggestions;
  

// ── Navigation ──────────────────────────────────────────
@override@JsonKey() final  int currentStep;
// ── Step 1: Full legal name ──────────────────────────────
@override@JsonKey() final  String fullName;
// ── Step 2: Date of birth ────────────────────────────────
@override final  DateTime? dateOfBirth;
// ── Step 3: Residential address ──────────────────────────
@override@JsonKey() final  String streetAddress;
@override@JsonKey() final  String city;
@override@JsonKey() final  String addressState;
@override@JsonKey() final  String postalCode;
@override@JsonKey() final  String country;
// Address autocomplete
 final  List<AddressSuggestionEntity> _addressSuggestions;
// Address autocomplete
@override@JsonKey() List<AddressSuggestionEntity> get addressSuggestions {
  if (_addressSuggestions is EqualUnmodifiableListView) return _addressSuggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addressSuggestions);
}

@override@JsonKey() final  bool isLoadingAddressSuggestions;
@override final  String? addressSuggestionsError;
@override@JsonKey() final  bool isAddressAutocompleteAvailable;
// ── Async / error flags ──────────────────────────────────
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSubmitted;
@override@JsonKey() final  bool isError;
@override final  String? errorMessage;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressState, addressState) || other.addressState == addressState)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._addressSuggestions, _addressSuggestions)&&(identical(other.isLoadingAddressSuggestions, isLoadingAddressSuggestions) || other.isLoadingAddressSuggestions == isLoadingAddressSuggestions)&&(identical(other.addressSuggestionsError, addressSuggestionsError) || other.addressSuggestionsError == addressSuggestionsError)&&(identical(other.isAddressAutocompleteAvailable, isAddressAutocompleteAvailable) || other.isAddressAutocompleteAvailable == isAddressAutocompleteAvailable)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,fullName,dateOfBirth,streetAddress,city,addressState,postalCode,country,const DeepCollectionEquality().hash(_addressSuggestions),isLoadingAddressSuggestions,addressSuggestionsError,isAddressAutocompleteAvailable,isSubmitting,isSubmitted,isError,errorMessage);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, fullName: $fullName, dateOfBirth: $dateOfBirth, streetAddress: $streetAddress, city: $city, addressState: $addressState, postalCode: $postalCode, country: $country, addressSuggestions: $addressSuggestions, isLoadingAddressSuggestions: $isLoadingAddressSuggestions, addressSuggestionsError: $addressSuggestionsError, isAddressAutocompleteAvailable: $isAddressAutocompleteAvailable, isSubmitting: $isSubmitting, isSubmitted: $isSubmitted, isError: $isError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, String fullName, DateTime? dateOfBirth, String streetAddress, String city, String addressState, String postalCode, String country, List<AddressSuggestionEntity> addressSuggestions, bool isLoadingAddressSuggestions, String? addressSuggestionsError, bool isAddressAutocompleteAvailable, bool isSubmitting, bool isSubmitted, bool isError, String? errorMessage
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? streetAddress = null,Object? city = null,Object? addressState = null,Object? postalCode = null,Object? country = null,Object? addressSuggestions = null,Object? isLoadingAddressSuggestions = null,Object? addressSuggestionsError = freezed,Object? isAddressAutocompleteAvailable = null,Object? isSubmitting = null,Object? isSubmitted = null,Object? isError = null,Object? errorMessage = freezed,}) {
  return _then(_OnboardingState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,addressState: null == addressState ? _self.addressState : addressState // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,addressSuggestions: null == addressSuggestions ? _self._addressSuggestions : addressSuggestions // ignore: cast_nullable_to_non_nullable
as List<AddressSuggestionEntity>,isLoadingAddressSuggestions: null == isLoadingAddressSuggestions ? _self.isLoadingAddressSuggestions : isLoadingAddressSuggestions // ignore: cast_nullable_to_non_nullable
as bool,addressSuggestionsError: freezed == addressSuggestionsError ? _self.addressSuggestionsError : addressSuggestionsError // ignore: cast_nullable_to_non_nullable
as String?,isAddressAutocompleteAvailable: null == isAddressAutocompleteAvailable ? _self.isAddressAutocompleteAvailable : isAddressAutocompleteAvailable // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSubmitted: null == isSubmitted ? _self.isSubmitted : isSubmitted // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
