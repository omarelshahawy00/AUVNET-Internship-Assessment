import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errMessage);

  // Handle Firebase Auth exceptions
  factory FirebaseFailure.fromAuthException(
      FirebaseAuthException authException) {
    switch (authException.code) {
      case "invalid-credential":
        return FirebaseFailure('Email or password is invalid.');
      case 'invalid-email':
        return FirebaseFailure('The email address is badly formatted.');
      case 'user-disabled':
        return FirebaseFailure('This user account has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found with this email address.');
      case 'invalid-password':
        return FirebaseFailure('Incorrect password. Please try again.');
      case 'email-already-in-use':
        return FirebaseFailure('This email address is already in use.');
      case 'operation-not-allowed':
        return FirebaseFailure('Email/password accounts are not enabled.');
      case 'weak-password':
        return FirebaseFailure('The password is too weak.');
      case 'requires-recent-login':
        return FirebaseFailure(
            'Please log in again to perform this operation.');
      case 'too-many-requests':
        return FirebaseFailure('Too many requests. Please try again later.');
      case 'network-request-failed':
        return FirebaseFailure('Network error. Please check your connection.');
      case 'invalid-verification-code':
        return FirebaseFailure('The verification code is invalid.');
      case 'invalid-verification-id':
        return FirebaseFailure('The verification ID is invalid.');
      case 'quota-exceeded':
        return FirebaseFailure('Quota exceeded. Please try again later.');
      case 'provider-already-linked':
        return FirebaseFailure('Account is already linked with this provider.');
      default:
        return FirebaseFailure('An unexpected Firebase error occurred.');
    }
  }

  // Handle Firestore exceptions
  factory FirebaseFailure.fromFirestoreException(
      FirebaseException firestoreException) {
    switch (firestoreException.code) {
      case 'cancelled':
        return FirebaseFailure('The operation was cancelled.');
      case 'unknown':
        return FirebaseFailure('An unknown Firestore error occurred.');
      case 'invalid-argument':
        return FirebaseFailure('Invalid argument provided.');
      case 'deadline-exceeded':
        return FirebaseFailure('The operation timed out.');
      case 'not-found':
        return FirebaseFailure('The requested document was not found.');
      case 'already-exists':
        return FirebaseFailure('A document with this ID already exists.');
      case 'permission-denied':
        return FirebaseFailure(
            'You don\'t have permission to perform this operation.');
      case 'resource-exhausted':
        return FirebaseFailure('Resource exhausted. Please try again later.');
      case 'failed-precondition':
        return FirebaseFailure(
            'Operation was rejected due to invalid system state.');
      case 'aborted':
        return FirebaseFailure('The operation was aborted.');
      case 'out-of-range':
        return FirebaseFailure('Operation was attempted past the valid range.');
      case 'unimplemented':
        return FirebaseFailure('This operation is not implemented.');
      case 'internal':
        return FirebaseFailure('Internal Firestore error occurred.');
      case 'unavailable':
        return FirebaseFailure('The service is currently unavailable.');
      case 'data-loss':
        return FirebaseFailure(
            'Unrecoverable data loss or corruption occurred.');
      case 'unauthenticated':
        return FirebaseFailure('User is not authenticated.');
      default:
        return FirebaseFailure('An unexpected Firestore error occurred.');
    }
  }

  // Handle Firebase Storage exceptions
  factory FirebaseFailure.fromStorageException(
      FirebaseException storageException) {
    switch (storageException.code) {
      case 'object-not-found':
        return FirebaseFailure('No object exists at the desired reference.');
      case 'bucket-not-found':
        return FirebaseFailure('No bucket is configured for Cloud Storage.');
      case 'project-not-found':
        return FirebaseFailure('No project is configured for Cloud Storage.');
      case 'quota-exceeded':
        return FirebaseFailure('Quota exceeded. Please try again later.');
      case 'unauthenticated':
        return FirebaseFailure('User is unauthenticated. Please log in.');
      case 'unauthorized':
        return FirebaseFailure(
            'User is not authorized to perform this action.');
      case 'retry-limit-exceeded':
        return FirebaseFailure('Maximum retry time for operation exceeded.');
      case 'invalid-checksum':
        return FirebaseFailure(
            'File corrupted during transfer. Checksum mismatch.');
      case 'canceled':
        return FirebaseFailure('User canceled the operation.');
      case 'invalid-event-name':
        return FirebaseFailure('Invalid event name provided.');
      case 'invalid-url':
        return FirebaseFailure('Invalid URL provided.');
      case 'invalid-argument':
        return FirebaseFailure('Invalid argument provided.');
      case 'no-default-bucket':
        return FirebaseFailure('No default bucket found.');
      case 'cannot-slice-blob':
        return FirebaseFailure('Cannot slice the requested blob.');
      case 'server-file-wrong-size':
        return FirebaseFailure('File size mismatch with server.');
      default:
        return FirebaseFailure('An unexpected Storage error occurred.');
    }
  }

  // Generic Firebase exception handler
  factory FirebaseFailure.fromFirebaseException(dynamic exception) {
    if (exception is FirebaseAuthException) {
      return FirebaseFailure.fromAuthException(exception);
    } else if (exception is FirebaseException) {
      if (exception is FirebaseAuthException) {
        return FirebaseFailure.fromAuthException(exception);
      } else if (exception.plugin == 'cloud_firestore') {
        return FirebaseFailure.fromFirestoreException(exception);
      } else if (exception.plugin == 'firebase_storage') {
        return FirebaseFailure.fromStorageException(exception);
      }
    }

    return FirebaseFailure('An unexpected Firebase error occurred.');
  }
}
