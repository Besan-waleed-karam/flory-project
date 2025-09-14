
import 'package:flory/data/repositories/authentication/authentication_repository.dart';
import 'package:flory/utils/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

import 'app.dart';

Future<void> main() async {

  /// Widgets Binding
  final  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.init();

  /// GetX local storage
  await GetStorage.init();

  //Todo: Await Native Splash
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// --  Initialize Firebase&Authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()));


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();







  runApp(const App());
}


