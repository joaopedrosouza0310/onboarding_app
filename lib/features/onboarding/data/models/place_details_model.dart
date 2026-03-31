import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details_model.freezed.dart';
part 'place_details_model.g.dart';

@freezed
abstract class PlaceDetailsModel with _$PlaceDetailsModel {
  const factory PlaceDetailsModel({
    @JsonKey(name: 'address_components')
    required List<AddressComponentModel> addressComponents,
    @JsonKey(name: 'formatted_address') required String formattedAddress,
  }) = _PlaceDetailsModel;

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsModelFromJson(json);

  /// Parses the Places API (New) response format.
  /// New API uses camelCase keys: `addressComponents`, `formattedAddress`.
  factory PlaceDetailsModel.fromNewApi(Map<String, dynamic> json) {
    final components = (json['addressComponents'] as List<dynamic>? ?? [])
        .map((c) => AddressComponentModel.fromNewApi(c as Map<String, dynamic>))
        .toList();

    return PlaceDetailsModel(
      addressComponents: components,
      formattedAddress: json['formattedAddress'] as String? ?? '',
    );
  }
}

@freezed
abstract class AddressComponentModel with _$AddressComponentModel {
  const factory AddressComponentModel({
    @JsonKey(name: 'long_name') required String longName,
    @JsonKey(name: 'short_name') required String shortName,
    required List<String> types,
  }) = _AddressComponentModel;

  factory AddressComponentModel.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentModelFromJson(json);

  /// Parses the Places API (New) response format.
  /// New API uses `longText`/`shortText` instead of `long_name`/`short_name`.
  factory AddressComponentModel.fromNewApi(Map<String, dynamic> json) {
    return AddressComponentModel(
      longName: json['longText'] as String? ?? '',
      shortName: json['shortText'] as String? ?? '',
      types: (json['types'] as List<dynamic>? ?? [])
          .map((t) => t as String)
          .toList(),
    );
  }
}
