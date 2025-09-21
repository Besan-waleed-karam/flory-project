import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flory/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  String fullName;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.profilePicture,
  });

  //function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);
  static String generateUsername(fullName){
    String fullToLowerCase = fullName.toLowerCase();
    String usernameWithPrefix = "cwt_$fullToLowerCase";
    return usernameWithPrefix;
  }
  // function to create empty user
  static UserModel empty() => UserModel(id: '', phoneNumber: '', username: '', email: '', profilePicture: '', fullName: '');

// convert model to json for storing data in firebase
  Map<String, dynamic> toJson(){
    return{
      'FullName' : fullName,
      'Username': username,
      'Email' : email,
      'PhoneNumber':phoneNumber,
      'ProfilePicture':profilePicture
    };
  }

// factory method to create a userModel
  factory UserModel.fromSnapshot (DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        fullName: data['FullName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    }else {
      return UserModel(
          id: document.id,
          fullName: '',
          username: '',
          email: '',
          phoneNumber: '',
          profilePicture: '');
    }
  }




}