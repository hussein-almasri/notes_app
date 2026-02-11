

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
 final FirebaseAuth _auth = FirebaseAuth.instance;
// register
  Future<User?> registerWithEmailAndPassword(  String email,  String password) 
  async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future<User?>loginWithEmailAndPassword(  String email,  String password)
  async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
