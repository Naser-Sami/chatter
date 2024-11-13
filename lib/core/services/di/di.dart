import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import '/config/_config.dart';
import '/features/_features.dart';

// Global Variable
// Initialize GetIt
final sl = GetIt.I;

class DI {
  Future<void> init() async {
    // BLOC's

    sl.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(),
    );

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

    sl.registerLazySingleton<ImageCubit>(
      () => ImageCubit(),
    );

    // LOCAL STORAGE

    // Firebase

    final FirebaseAuth auth = FirebaseAuth.instance;
    sl.registerLazySingleton<FirebaseAuth>(() => auth);

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    sl.registerLazySingleton<FirebaseFirestore>(() => firestore);

    final FirebaseStorage storage = FirebaseStorage.instance;
    sl.registerLazySingleton<FirebaseStorage>(() => storage);

    // REPOSITORIES

    sl.registerLazySingleton<IFirebaseAuthService>(
      () => FirebaseAuthService(),
    );
  }
}
