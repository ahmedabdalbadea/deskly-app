import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/core/errors/failure.dart';

class FirestoreFailure extends Failure {
  FirestoreFailure(super.message);

  factory FirestoreFailure.fromFirebaseException(
    FirebaseException e,
  ) {
    final message = switch (e.code) {
      'permission-denied' =>
        'You do not have permission to perform this action.',

      'not-found' =>
        'The requested resource was not found.',

      'unavailable' =>
        'The service is currently unavailable. Please try again later.',

      'deadline-exceeded' =>
        'The request timed out. Please try again later.',

      'unauthenticated' =>
        'You are not authenticated. Please log in to continue.',

      'invalid-argument' =>
        'Invalid argument provided. Please try again.',

      'failed-precondition' =>
        'The operation cannot be performed under the current state.',

      'resource-exhausted' =>
        'Usage limit exceeded. Please try again later.',

      'internal' =>
        'An internal error occurred. Please try again later.',

      'aborted' =>
        'The operation was aborted. Please try again.',

      'unimplemented' =>
        'This operation is not implemented.',

      _ => e.message ?? 'An unexpected error occurred.',
    };

    return FirestoreFailure(message);
  }
}