import 'package:firebase_auth/firebase_auth.dart';
import 'package:flory/screens/loginScreens/SignInScreen.dart';
import 'package:flory/screens/onBoarding/onBoarding.dart';
import 'package:flory/utils/local_storage/storage_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../screens/RegisterScreens/verify_email.dart';
import '../../../screens/onBoarding/welcomScreen.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/formate_exception.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../widgets/navigation_menu.dart';



class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async{
    final user = _auth.currentUser;

    if(user != null){
      // if user is logged in
      if(user.emailVerified){

        // Initialize uUser Specific Storage
        await TLocalStorage.init(user.uid);
        // if user's email is verified, navigate to the navigation menu.
        Get.offAll(()=>NavigationMenu());
      }else{
        // if user's email is not verified, navigate to the verify screen
        Get.offAll(()=>VerifyEmail(email: _auth.currentUser?.email,));
      }
    } else{
      //local Storage
      if(kDebugMode){
        print('------------- Get Storage Auth Repository -----------------');
        print(deviceStorage.read('IsFirstTime'));
      }

      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime')!= true ?
      Get.offAll(()=>const Welcomescreen()):
      Get.offAll(const OnBoarding());
    }
  }

  ///Email Authentication  SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email , String password)async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  // Email Authentication - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email , String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }

  }
  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  // Google sign in ----
  Future<UserCredential> signInWithGoogle()async{
    try{
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // obtain the auth details from the request.
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      // create anew  credentials
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      // once signed in return  the user credentials.
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw '❌ FirebaseAuthException code=${e.code} message=${e.message}';
    } on FormatException catch (_){
      throw TFormatException();
    } on PlatformException catch (e){
      throw '❌ PlatformException code=${e.code} message=${e.message} details=${e.details}';
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
// Facebook sign in ----
//   Future<UserCredential> signInWithFacebook() async {
//     try {
//         // Trigger the sign-in flow
//         final LoginResult loginResult = await FacebookAuth.instance.login();
//
//         // Create a credential from the access token
//         final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//         // Once signed in, return the UserCredential
//         return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//       }
//      on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
  /// Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // logout user
  Future <void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>const Welcomescreen());
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong please try again';
    }
  }

}