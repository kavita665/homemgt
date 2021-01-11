

// If FirebaseAuth and/or GoogleSignIn are not injected into the UserRepository, then we instantiate them internally.
// This allows us to be able to inject mock instances so that we can easily test the UserRepository

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  

  UserRepository(
      {FirebaseAuth firebaseAuth,
      GoogleSignIn googleSignin,
     })
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ??
            GoogleSignIn(scopes: [
              'email',
              'https://www.googleapis.com/auth/contacts.readonly',
            ]);


  Future<User> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
//    try {
////      await _googleSignIn.signOut();
//      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//      final GoogleSignInAuthentication googleAuth =
//          await googleUser.authentication;
//      final AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//      print(googleAuth.accessToken);
//      await _firebaseAuth.signInWithCredential(credential);
//      final FirebaseUser user = await _firebaseAuth.currentUser();
//      print(user);
//      return user;
//    } catch (e) {
//      print(e);
//    }
  }

  Future<void> updateAuth({String name, String birthday}) async {
    var auth = await _firebaseAuth.currentUser();
    final UserUpdateInfo info = UserUpdateInfo();
    info.displayName = name;
    await auth.updateProfile(info);
    final Firestore _firestore = Firestore.instance;
    final userRef =
        await _firestore.collection("users").document(auth.uid).get();

    await userRef.reference
        .setData({"displayName": name, "birthday": birthday}, merge: true);
    return auth.reload();
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<User> getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

}
