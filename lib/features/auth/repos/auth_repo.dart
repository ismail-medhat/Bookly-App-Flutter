import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  /// Create Account with Email and Password
  Future<User?> createAccount(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Returns the created user
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message);
    }
  }

  /// Login with Email and Password
  Future<User?> login({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Returns the logged-in user
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message);
    }
  }

  /// Logout User
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  /// Get Current User
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}

class AuthException implements Exception {
  final String code;
  final String? message;

  AuthException(this.code, [this.message]);

  @override
  String toString() => 'AuthException: $code - $message';
}
