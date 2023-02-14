//import 'package:proton/authentication/signup_screen.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../global/global.dart';
import '../splashScreen/splash_screen.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (!emailTextEditingController.text.contains('@')) {
      Fluttertoast.showToast(msg: 'Email address is not valid.');
    } else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Password is required');
    } else {
      loginDriverNow();
    }
  }

  loginDriverNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: 'Logging in, Please wait...',
          );
        });

    final User? firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Error:$msg');
    }))
        .user;
    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: 'Login Successful.');
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Error Occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/1.gif',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Car Owner Login',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email Address',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
              TextButton(
                child: const Text('Do not have an Account? SignUp Here',
                    style: TextStyle(color: Colors.grey)),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (c) => SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
