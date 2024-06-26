import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/crypto_service.dart';
import 'package:loogisti/app/data/models/firebase_auth_credential_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthenticationService {
  Future<FirebaseAuthCredentialModel?> googleAuthentication({
    Function? onLoading,
    Function? onFinal,
  }) async {
    try {
      if (onLoading != null) onLoading();
      FirebaseAuthCredentialModel? firebaseAuthCredential;
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
        OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        firebaseAuthCredential = FirebaseAuthCredentialModel(firebaseUserCredential: userCredential, googleUserData: googleUser);
        if (onFinal != null) onFinal();
        return firebaseAuthCredential;
      }
    } catch (error) {
      print('error in firebase auth:: ${error.toString()}');
      ToastComponent.showErrorToast(
        Get.context!,
        text: StringsAssetsConstants.serverErrorMessage,
      );
    } finally {
      if (onFinal != null) onFinal();
    }
    return null;
  }

  Future<FirebaseAuthCredentialModel?> anonymousAuthentication({
    Function? onLoading,
    Function? onFinal,
  }) async {
    if (onLoading != null) onLoading();
    try {
      FirebaseAuthCredentialModel? firebaseAuthCredential;
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      firebaseAuthCredential = FirebaseAuthCredentialModel(firebaseUserCredential: userCredential);
      if (onFinal != null) onFinal();
      return firebaseAuthCredential;
    } catch (error) {
      print(error.toString());
      ToastComponent.showErrorToast(
        Get.context!,
        text: StringsAssetsConstants.serverErrorMessage,
      );
    }
    return null;
  }

  Future<FirebaseAuthCredentialModel?> appleAuthentication({
    Function? onLoading,
    Function? onFinal,
  }) async {
    try {
      if (onLoading != null) onLoading();
      final rawNonce = generateNonce();
      final nonce = CryptoService.sha256ofString(rawNonce);
      AuthorizationCredentialAppleID? appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      print('user data::: ${userCredential.user?.uid}, ${userCredential.user?.email}');
      return FirebaseAuthCredentialModel(appleUserData: appleCredential, firebaseUserCredential: userCredential);
    } catch (error) {
      if (onFinal != null) onFinal();
      print('error::::: $error');
    }
    return null;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
