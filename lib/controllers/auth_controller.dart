import 'package:ecommerce_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  //function to sign up users

  Future<String> signUpUser(
      String full_name, String username, String email, String password) async {
    String res = 'some error occured';

    try {
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.email);
        res = 'sucessed';
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    print(res);
    return res;
  }
}
