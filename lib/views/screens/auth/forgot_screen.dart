import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/const.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  forgotPassword() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().forgotPassword(_emailController.text);
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      return showSnackBar('Link has been sent to the email address', context);
    } else {
      return showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Forgot Password',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Your Email',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: mybutttonColor,
            ),
            child: Center(
              child: InkWell(
                onTap: forgotPassword,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Text(
                        'Forget Password',
                        style: TextStyle(
                          color: textButtonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
