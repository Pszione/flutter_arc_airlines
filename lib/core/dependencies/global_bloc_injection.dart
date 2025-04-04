import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core.dart';

class GlobalBlocInjection extends StatelessWidget {
  final Widget? child;

  const GlobalBlocInjection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ThemeCubit>(create: (context) => di<ThemeCubit>())],
      child: child ?? SizedBox.shrink(),
    );
  }
}
