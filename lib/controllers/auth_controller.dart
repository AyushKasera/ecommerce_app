import 'package:ecommerce_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //function to enable users pick image

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image selected');
    }
  }

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
        fiebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'userNaeme': username,
          'email': email,
        });
        print(cred.user!.email);
        res = 'sucess';
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
