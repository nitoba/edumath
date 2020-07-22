import 'package:edumath/app/modules/login/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class ILoginWithFirebase {
  Future<UserModel> handleSingIn();
  Future<UserModel> handleGetUserLogged();
  Future<void> logout();
}

class LoginWithFirebase implements ILoginWithFirebase {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> handleSingIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser firebaseUser =
        (await _auth.signInWithCredential(credential)).user;

    return UserModel.fromFirebaseUser(firebaseUser);
  }

  @override
  Future<UserModel> handleGetUserLogged() async {
    final firebaseUser = await _auth.currentUser();
    return firebaseUser != null
        ? UserModel.fromFirebaseUser(firebaseUser)
        : null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
