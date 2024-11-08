import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';

final providers = [
  BlocProvider<ThemeCubit>(
    create: (context) => sl<ThemeCubit>(),
  ),
  BlocProvider<BottomNavigationBarCubit>(
    create: (context) => sl<BottomNavigationBarCubit>(),
  ),
];
