// import 'dart:typed_data';
// import 'package:proton/authentication/car_info_screen.dart';
// import 'package:proton/responsive/mobile_screen_layout.dart';
// import 'package:proton/responsive/responsive_layout.dart';
// import 'package:proton/responsive/web_screen_layout.dart';

// import 'package:proton/global/global.dart';
// import 'package:proton/splashScreen/splash_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../widgets/progress_dialog.dart';
// import 'login_screen.dart';

// // import 'package:proton/utils/utils.dart';
// // import 'package:proton/widgets/text_field_input.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController nameTextEditingController = TextEditingController();
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController phoneTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
//   TextEditingController bioController = TextEditingController();

//   get bioTextEditingController => null;

//   // Uint8List? image;

//   validateForm() {
//     if (nameTextEditingController.text.length < 3) {
//       Fluttertoast.showToast(msg: 'Name must be atleast 3 characters.');
//     } else if (!emailTextEditingController.text.contains('@')) {
//       Fluttertoast.showToast(msg: 'Email is not valid.');
//     } else if (phoneTextEditingController.text.isEmpty) {
//       Fluttertoast.showToast(msg: 'Phone number is required.');
//     } else if (passwordTextEditingController.text.length < 6) {
//       Fluttertoast.showToast(msg: 'Password must be atleast 6 characters.');
//     } else {
//       saveDriverInfoNow();
//     }
//   }

//   saveDriverInfoNow() async {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext c) {
//           return ProgressDialog(
//             message: 'Processing, Please wait...',
//           );
//         });

//     final User? firebaseUser = (await fAuth
//             .createUserWithEmailAndPassword(
//       email: emailTextEditingController.text.trim(),
//       password: passwordTextEditingController.text.trim(),
//     )
//             .catchError(
//       (msg) {
//         Navigator.pop(context);
//         Fluttertoast.showToast(msg: 'Error:' + msg.toString());
//       },
//     ))
//         .user;

//     if (firebaseUser != null) {
//       Map driverMap = {
//         'id': firebaseUser.uid,
//         'name': nameTextEditingController.text.trim(),
//         'email': emailTextEditingController.text.trim(),
//         'phone': phoneTextEditingController.text.trim(),
//         //'bio': bioTextEditingController.text.trim()
//         //
//       };
//       DatabaseReference driversRef =
//           FirebaseDatabase.instance.ref().child('drivers');
//       driversRef.child(firebaseUser.uid).set(driverMap);

//       currentFirebaseUser = firebaseUser;

//       Fluttertoast.showToast(msg: 'Account has been created.');
//       Navigator.push(
//           context, MaterialPageRoute(builder: (c) => const CarInfoScreen()));
//     } else {
//       Navigator.pop(context);
//       Fluttertoast.showToast(msg: 'Account has not been created.');
//     }
//   }

//   // selectImage() async {
//   //   Uint8List im = await pickImage(ImageSource.gallery);
//   //   // set state because we need to display the image we selected on the circle avatar
//   //   setState(() {
//   //     _image = im;
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Image.asset(
//                   'images/1.gif',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Car Owner SignUp',
//                 style: TextStyle(
//                   fontSize: 26,
//                   color: Colors.white54,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextField(
//                 controller: nameTextEditingController,
//                 keyboardType: TextInputType.text,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   hintText: 'Name',
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 20,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: emailTextEditingController,
//                 keyboardType: TextInputType.emailAddress,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Email Address',
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 20,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: phoneTextEditingController,
//                 keyboardType: TextInputType.phone,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: 'PhoneNumber',
//                   hintText: 'Phone',
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 20,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: bioTextEditingController,
//                 keyboardType: TextInputType.text,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: 'Bio',
//                   hintText: 'Your Bio',
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 20,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: passwordTextEditingController,
//                 keyboardType: TextInputType.text,
//                 obscureText: true,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   hintText: 'Password',
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 20,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   validateForm();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.lightGreen,
//                 ),
//                 child: const Text(
//                   'Create Account',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//               TextButton(
//                   child: const Text('Already have an Account? Login Here',
//                       style: TextStyle(color: Colors.grey)),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (c) => const LoginScreen()));
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
