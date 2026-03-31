import 'package:injectable/injectable.dart';
import 'package:onboarding_app/core/error/app_exception.dart';
import 'package:onboarding_app/core/error/error_mapper.dart';
import 'package:onboarding_app/core/result/result.dart';
import 'package:onboarding_app/features/onboarding/data/datasources/places_remote_datasource.dart';
import 'package:onboarding_app/features/onboarding/data/mappers/places_mapper.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/entities/address_suggestion_entity.dart';
import 'package:onboarding_app/features/onboarding/domain/repositories/places_repository.dart';

@Singleton(as: PlacesRepository)
class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesRemoteDatasource _datasource;

  const PlacesRepositoryImpl(this._datasource);

  @override
  Future<Result<List<AddressSuggestionEntity>>> searchSuggestions(
    String query,
  ) async {
    try {
      final models = await _datasource.searchSuggestions(query);
      final entities = models.map(PlacesMapper.toSuggestionEntity).toList();
      return Result.success(entities);
    } on AppException catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    } catch (e) {
      return Result.failure(AppFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<AddressEntity>> getAddressDetails(String placeId) async {
    try {
      final model = await _datasource.getPlaceDetails(placeId);
      final entity = PlacesMapper.toAddressEntity(model);
      return Result.success(entity);
    } on AppException catch (e) {
      return Result.failure(mapExceptionToFailure(e));
    } catch (e) {
      return Result.failure(AppFailure.unknown(message: e.toString()));
    }
  }
}
