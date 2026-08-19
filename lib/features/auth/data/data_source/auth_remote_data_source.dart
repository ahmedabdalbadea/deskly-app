import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/constants.dart';
import 'package:deskly_app/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  AuthRemoteDataSource({
    required this._firebaseAuth,
    required this._fireStore,
    required this._googleSignIn,
    required this._facebookAuth,
  });

  Future<UserCredential> register({
    required String email,
    required String password,
  }) => _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  Future<void> createUserDocument({required UserModel user}) async {
    return await _fireStore
        .collection(kUsersCollection)
        .doc(user.uId)
        .set(user.toJson());
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) => _firebaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<LoginResult> loginWithFacebook() async {
    return await _facebookAuth.login(permissions: ['email']);
  }

  Future<UserCredential> loginWithFacebookCredential({
    required String token,
  }) async {
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(token);
    return await _firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

  Future<bool> userDocumentExists({required String uId}) async {
    final doc = await _fireStore.collection(kUsersCollection).doc(uId).get();

    return doc.exists;
  }

  Future<void> resetPassword({required String email}) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> initializeGoogleSignIn() async {
    await _googleSignIn.initialize(
      serverClientId:
          "253628741321-blvlil8abbk6gjemjs5jqlvck45es1gr.apps.googleusercontent.com",
    );
  }
}
