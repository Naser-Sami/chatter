import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/firebase_options.dart';
import 'app/bloc_providers.dart';
import 'core/_core.dart';

import 'app/app.dart';

Future<void> main() async {
  // -- Add Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();

  // -- Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // -- Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('settings');

  // -- Initialize GetIt
  await DI().init();

  runApp(
    MultiBlocProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}
