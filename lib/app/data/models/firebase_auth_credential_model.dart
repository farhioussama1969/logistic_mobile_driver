import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthCredentialModel {
  UserCredential? firebaseUserCredential;
  GoogleSignInAccount? googleUserData;
  AuthorizationCredentialAppleID? appleUserData;

  FirebaseAuthCredentialModel({this.firebaseUserCredential, this.googleUserData, this.appleUserData});
}
