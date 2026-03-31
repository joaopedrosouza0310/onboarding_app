import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_app/core/di/injection.dart';

class BlocConsumerX<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Function(BuildContext context, S state, B cubit) listener;
  final BlocBuilderCondition<S>? buildWhen;
  final Widget Function(BuildContext context, S state, B cubit) builder;

  const BlocConsumerX({
    super.key,
    required this.listener,
    this.buildWhen,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<B>();

    return BlocConsumer<B, S>(
      buildWhen: buildWhen,
      bloc: cubit,
      listener: (context, state) {
        listener(context, state, cubit);
      },
      builder: (context, state) {
        return builder(context, state, cubit);
      },
    );
  }
}
