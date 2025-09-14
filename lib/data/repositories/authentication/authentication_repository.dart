import 'package:flory/screens/loginScreens/SignInScreen.dart';
import 'package:flory/screens/onBoarding/onBoarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance =>Get.find();

  /// variables
  final deviceStorage = GetStorage();

  /// called from main.dart on app lunch

@override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  

  /// function to show relevant screen
 screenRedirect() async{

  if(kDebugMode){
    print("=============GET STORAGE Auth Repo============");
    print(deviceStorage.read('IsFirstTime'));
  }
  deviceStorage.writeIfNull('IsFirstTime', true);
  deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const SignInScreen()) : Get.offAll(const OnBoarding());
 }
}