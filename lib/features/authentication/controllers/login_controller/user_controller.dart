import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../data/user/user_repository.dart';
import '../../../../utils/loader/loaders.dart';
import '../../models/user_model.dart';

class   UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  // save userRecord from any registration provider.
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      if(userCredentials !=null) {
        final fullName = userCredentials.user!.displayName ?? '';
        final username = UserModel.generateUsername(fullName);

        // Map data
        final user = UserModel(
            id: userCredentials.user!.uid,
            fullName: fullName,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            username: username,
            profilePicture: userCredentials.user!.photoURL ?? ''
        );
        // save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e){
      Loaders.warningSnackBar(title: 'Data not saved',
          message: 'Something went wrong while saving your info. you can resave your data in your profile.'
      );
    }
  }

}