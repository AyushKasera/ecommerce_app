import 'dart:typed_data';

import 'package:ecommerce_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //funtion to add image to storage
  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

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

  Future<String> signUpUser(String full_name, String username, String email,
      String password, Uint8List? image) async {
    String res = 'some error occured';

    try {
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

      String downloadUrl=await  _uploadImageToStorage(image);

        await fiebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'userNaeme': username,
          'email': email,
          'image': downloadUrl,
        });
        print(cred.user!.email);
        res = 'sucess';
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
