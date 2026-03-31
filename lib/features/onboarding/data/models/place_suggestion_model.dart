import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_suggestion_model.freezed.dart';
part 'place_suggestion_model.g.dart';

@freezed
abstract class PlaceSuggestionModel with _$PlaceSuggestionModel {
  const factory PlaceSuggestionModel({
    @JsonKey(name: 'place_id') required String placeId,
    required String description,
  }) = _PlaceSuggestionModel;

  factory PlaceSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceSuggestionModelFromJson(json);
}
