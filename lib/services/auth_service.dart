import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:logging/logging.dart';
import '../models/user_model.dart'; // Adjust the path as necessary

final Logger _logger = Logger('AuthService');

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  User? _userFromFirebaseUser(auth.User? user) {
    return user != null ? User(id: user.uid, email: user.email) : null;
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      auth.User? user = result.user;
      return _userFromFirebaseUser(user);
    } on auth.FirebaseAuthException catch (e) {
      _logger.severe(e.message);
      return null;
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      auth.User? user = result.user;
      return _userFromFirebaseUser(user);
    } on auth.FirebaseAuthException catch (e) {
      _logger.severe(e.message);
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _logger.severe(e.toString());
    }
  }
}
