import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //register
  Future<void> signUpWithEmail(
      String email, String password, String name, String tel) async {
    try {
      // Create New User Account to Firebase Authen
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;
      print(uid);

      // Store User infomation (name, tel) to FireStore
      FirebaseFirestore.instance.collection("Users").doc(uid).set({
        "name": name,
        "tel": tel,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //login
  static Future<int> loginUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Successful");
      return 1;
    } on FirebaseAuthException catch (e) {
      print("Failed");
      print(e.code);

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return 2;
    } catch (e) {
      print(e);
    }
    return 0;
  }

  // logout
  static Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
