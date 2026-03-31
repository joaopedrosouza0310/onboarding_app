import 'package:onboarding_app/core/result/result.dart';

abstract class UseCase<T, P> {
  Future<Result<T>> call(P params);
}

class NoParams {
  const NoParams();
}
