import 'dart:typed_data';
import 'package:ecommerce_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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

        String downloadUrl = await _uploadImageToStorage(image);

        await fiebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'userNaeme': username,
          'email': email,
          'image': downloadUrl,
        });
        print(cred.user!.email);
        res = 'success';
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

//funtion to login Users
  loginUsers(String email, String password) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print('you are now logged in');
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  forgotPassword(String email) async {
    String res = 'some error occurd';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
        print('A reset link has been sent to your email ');
      } else {
        res = 'Email field must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

showSnackBar(String contant, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(contant)));
}
