// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/onboarding/data/datasources/places_remote_datasource.dart'
    as _i348;
import '../../features/onboarding/data/datasources/places_remote_datasource_impl.dart'
    as _i877;
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart'
    as _i452;
import '../../features/onboarding/data/repositories/places_repository_impl.dart'
    as _i488;
import '../../features/onboarding/domain/repositories/onboarding_repository.dart'
    as _i430;
import '../../features/onboarding/domain/repositories/places_repository.dart'
    as _i338;
import '../../features/onboarding/domain/usecases/get_address_details_usecase.dart'
    as _i68;
import '../../features/onboarding/domain/usecases/search_address_usecase.dart'
    as _i522;
import '../../features/onboarding/domain/usecases/submit_onboarding_usecase.dart'
    as _i933;
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i807;
import '../locale/locale_cubit.dart' as _i877;
import '../services/analytics_service.dart' as _i222;
import '../services/crashlytics_service.dart' as _i352;
import '../storage/local_storage_service.dart' as _i744;
import '../storage/secure_storage_service.dart' as _i666;
import '../theme/theme_cubit.dart' as _i611;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i222.AnalyticsService>(() => _i222.AnalyticsServiceImpl());
    gh.singleton<_i352.CrashlyticsService>(
      () => _i352.CrashlyticsServiceImpl(),
    );
    gh.singleton<_i430.OnboardingRepository>(
      () => const _i452.OnboardingRepositoryImpl(),
    );
    gh.singleton<_i744.LocalStorageService>(
      () => _i744.LocalStorageServiceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i348.PlacesRemoteDatasource>(
      () => _i877.PlacesRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i877.LocaleCubit>(
      () => _i877.LocaleCubit(gh<_i744.LocalStorageService>()),
    );
    gh.lazySingleton<_i611.ThemeCubit>(
      () => _i611.ThemeCubit(gh<_i744.LocalStorageService>()),
    );
    gh.singleton<_i338.PlacesRepository>(
      () => _i488.PlacesRepositoryImpl(gh<_i348.PlacesRemoteDatasource>()),
    );
    gh.factory<_i933.SubmitOnboardingUseCase>(
      () => _i933.SubmitOnboardingUseCase(gh<_i430.OnboardingRepository>()),
    );
    gh.factory<_i68.GetAddressDetailsUseCase>(
      () => _i68.GetAddressDetailsUseCase(gh<_i338.PlacesRepository>()),
    );
    gh.factory<_i522.SearchAddressUseCase>(
      () => _i522.SearchAddressUseCase(gh<_i338.PlacesRepository>()),
    );
    gh.singleton<_i666.SecureStorageService>(
      () => _i666.SecureStorageServiceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i807.OnboardingCubit>(
      () => _i807.OnboardingCubit(
        gh<_i933.SubmitOnboardingUseCase>(),
        gh<_i522.SearchAddressUseCase>(),
        gh<_i68.GetAddressDetailsUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
