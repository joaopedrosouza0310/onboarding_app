// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceDetailsModel _$PlaceDetailsModelFromJson(Map<String, dynamic> json) =>
    _PlaceDetailsModel(
      addressComponents: (json['address_components'] as List<dynamic>)
          .map((e) => AddressComponentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedAddress: json['formatted_address'] as String,
    );

Map<String, dynamic> _$PlaceDetailsModelToJson(_PlaceDetailsModel instance) =>
    <String, dynamic>{
      'address_components': instance.addressComponents,
      'formatted_address': instance.formattedAddress,
    };

_AddressComponentModel _$AddressComponentModelFromJson(
  Map<String, dynamic> json,
) => _AddressComponentModel(
  longName: json['long_name'] as String,
  shortName: json['short_name'] as String,
  types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddressComponentModelToJson(
  _AddressComponentModel instance,
) => <String, dynamic>{
  'long_name': instance.longName,
  'short_name': instance.shortName,
  'types': instance.types,
};
