import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _google = GoogleSignIn();

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authState => _auth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await _google.signIn();
    if (googleUser == null) return null;
    final googleAuth = await googleUser.authentication;
    return _auth.signInWithCredential(GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ));
  }

  Future<void> signOut() async {
    await _google.signOut();
    await _auth.signOut();
  }
}
