import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_app/core/di/injection.dart';

class BlocBuilderX<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget Function(BuildContext context, S state, B cubit) builder;

  const BlocBuilderX({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<B>();

    return BlocBuilder<B, S>(
      bloc: cubit,
      builder: (context, state) {
        return builder(context, state, cubit);
      },
    );
  }
}
