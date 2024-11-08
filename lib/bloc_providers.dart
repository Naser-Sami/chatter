import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/_config.dart';
import 'features/_features.dart';

final providers = [
  BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
];
