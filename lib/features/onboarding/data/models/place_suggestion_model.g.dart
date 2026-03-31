// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceSuggestionModel _$PlaceSuggestionModelFromJson(
  Map<String, dynamic> json,
) => _PlaceSuggestionModel(
  placeId: json['place_id'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$PlaceSuggestionModelToJson(
  _PlaceSuggestionModel instance,
) => <String, dynamic>{
  'place_id': instance.placeId,
  'description': instance.description,
};
