import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppFailure failure) = Failure<T>;
}

@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.server({required String message, int? statusCode}) =
      ServerFailure;
  const factory AppFailure.network({String? message}) = NetworkFailure;
  const factory AppFailure.cache({String? message}) = CacheFailure;
  const factory AppFailure.auth({String? message}) = AuthFailure;
  const factory AppFailure.unknown({String? message}) = UnknownFailure;
}
