import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/constants/app_constants.dart';
import 'package:onboarding_app/core/error/app_exception.dart';
import 'package:onboarding_app/core/network/network_error_mapper.dart';
import 'package:onboarding_app/features/onboarding/data/datasources/places_remote_datasource.dart';
import 'package:onboarding_app/features/onboarding/data/models/place_details_model.dart';
import 'package:onboarding_app/features/onboarding/data/models/place_suggestion_model.dart';

@Singleton(as: PlacesRemoteDatasource)
class PlacesRemoteDatasourceImpl implements PlacesRemoteDatasource {
  final Dio _dio;

  const PlacesRemoteDatasourceImpl(this._dio);

  // Places API (New) endpoints
  static const _autocompleteUrl =
      'https://places.googleapis.com/v1/places:autocomplete';
  static const _detailsBaseUrl = 'https://places.googleapis.com/v1/places/';

  @override
  Future<List<PlaceSuggestionModel>> searchSuggestions(String query) async {
    _assertApiKeyConfigured();
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        _autocompleteUrl,
        data: {
          'input': query,
          'includedPrimaryTypes': ['street_address', 'route', 'subpremise'],
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Goog-Api-Key': PlacesApiConstants.apiKey,
          },
        ),
      );
      final suggestions = response.data?['suggestions'] as List<dynamic>? ?? [];
      return suggestions.map((s) {
        final prediction =
            (s as Map<String, dynamic>)['placePrediction']
                as Map<String, dynamic>;
        return PlaceSuggestionModel(
          placeId: prediction['placeId'] as String? ?? '',
          description:
              (prediction['text'] as Map<String, dynamic>?)?['text']
                  as String? ??
              '',
        );
      }).toList();
    } on DioException catch (e) {
      throw NetworkErrorMapper.mapDioException(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<PlaceDetailsModel> getPlaceDetails(String placeId) async {
    _assertApiKeyConfigured();
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_detailsBaseUrl$placeId',
        options: Options(
          headers: {
            'X-Goog-Api-Key': PlacesApiConstants.apiKey,
            'X-Goog-FieldMask': 'addressComponents,formattedAddress',
          },
        ),
      );
      final data = response.data ?? {};
      return PlaceDetailsModel.fromNewApi(data);
    } on DioException catch (e) {
      throw NetworkErrorMapper.mapDioException(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  void _assertApiKeyConfigured() {
    if (PlacesApiConstants.apiKey.isEmpty) {
      throw const NetworkException(
        message: 'Address search unavailable: API key not configured',
      );
    }
  }
}
