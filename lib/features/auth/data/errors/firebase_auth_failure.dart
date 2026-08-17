import 'package:deskly_app/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.message);

  factory FirebaseAuthFailure.fromAuthException(FirebaseAuthException e) {
    final message = switch (e.code) {
      'invalid-email' => 'The email address is not valid.',

      'invalid-credential' => 'Invalid email or password. Please try again.',

      'wrong-password' => 'Incorrect password. Please try again.',

      'user-not-found' => 'No account found with this email address.',

      'user-disabled' => 'This account has been disabled.',

      'email-already-in-use' =>
        'An account already exists with this email address.',

      'weak-password' =>
        'The password is too weak. Please choose a stronger password.',

      'too-many-requests' => 'Too many attempts. Please try again later.',

      'network-request-failed' =>
        'Network error. Please check your connection.',

      'operation-not-allowed' => 'This sign-in method is not enabled.',

      'account-exists-with-different-credential' =>
        'An account already exists with a different sign-in method.',

      'credential-already-in-use' =>
        'This credential is already associated with another account.',

      'user-token-expired' ||
      'invalid-user-token' => 'Your session has expired. Please sign in again.',

      _ => e.message ?? 'An unexpected authentication error occurred.',
    };

    return FirebaseAuthFailure(message);
  }
}
