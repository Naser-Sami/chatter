import 'package:get_it/get_it.dart';

import '/config/_config.dart';
import '/features/_features.dart';

// Global Variable
// Initialize GetIt
final sl = GetIt.I;

class DI {
  Future<void> init() async {
    // BLOC's

    // CUBIT's

    sl.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(),
    );

    sl.registerLazySingleton<BottomNavigationBarCubit>(
      () => BottomNavigationBarCubit(),
    );

    sl.registerLazySingleton<CountryPickerCubit>(
      () => CountryPickerCubit(),
    );

    sl.registerLazySingleton<LoginCubit>(
      () => LoginCubit(),
    );

    // LOCAL STORAGE
  }
}
