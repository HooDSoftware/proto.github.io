// import 'package:flutter/material.dart';
// import 'package:proton/data/database_helper.dart';
// import 'package:proton/model1/user.dart';
// import 'package:proton/pages/login/login_presenter.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

//  class _LoginPageState extends State<LoginPage> implements LoginPageContract {
//   BuildContext _ctx;
//   bool _isLoading = false;
//   final formKey = GlobalKey<FormState>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
  
  


//   late String _username, _password;

//   late LoginPagePresenter _presenter;

//   _LoginPageState() {
//     _presenter = LoginPagePresenter(this);
//   }

//   void _submit() {
//     final form = formKey.currentState;

//     if (form!.validate()) {
//       setState(() {
//         _isLoading = true;
//         form.save();
//         _presenter.doLogin(_username, _password);
//       });
//     }
//   }

// void _showSnackBar(String text) {
//     scaffoldKey.currentState!.showSnackbar(SnackBar(
//       content: new Text(text),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _ctx = context;
//     var loginBtn = RaisedButton(
//       onPressed: _submit,
//       child: Text("Login"),
//       color: Colors.green,
//     );
//     var loginForm = Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           "Sqflite App Login",
//           textScaleFactor: 2.0,
//         ),
//         Form(
//           key: formKey,
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   onSaved: (val) => _username = val!,
//                   decoration: InputDecoration(labelText: "Username"),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   onSaved: (val) => _password = val!,
//                   decoration: InputDecoration(labelText: "Password"),
//                 ),
//               )
//             ],
//           ),
//         ),
//         loginBtn
//       ],
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login Page"),
//       ),
//       key: scaffoldKey,
//       body: Container(
//         child: Center(
//           child: loginForm,
//         ),
//       ),
//     );
//   }

//   // @override
//   // void onLoginError(String error) {
//   //   // TODO: implement onLoginError
//   //   _showSnackBar(error);
//   //   setState(() {
//   //     _isLoading = false;2
//   //   });
//   // }

//   @override
//   void onLoginSuccess(User user) async {
//     // TODO: implement onLoginSuccess
//     _showSnackBar(user.toString());
//     setState(() {
//       _isLoading = false;
//     });
//     var db = DatabaseHelper();
//     await db.saveUser(user);
//     Navigator.of(context).pushNamed("/home");
//   }
// }

// RaisedButton(
//     {required void Function() onPressed,
//     required Text child,
//     required MaterialColor color}) {}
