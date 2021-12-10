import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const options = FirebaseOptions(
    apiKey: 'AIzaSyD6MAhwnvSl9DFPSZpLBFFGdgBVZc5nOJM',
    appId: '1:899279418860:web:aa9d5aa17b63fd64183cc9',
    messagingSenderId: '899279418860',
    projectId: 'webnotify-a17f7',
  );

  await Firebase.initializeApp(options: options);

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
