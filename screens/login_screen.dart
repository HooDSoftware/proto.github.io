// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, sort_child_properties_last
//import '../auth_sql/user.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:proton/resources/auth_methods.dart';
import 'package:proton/responsive/mobile_screen_layout.dart';
import 'package:proton/responsive/responsive_layout.dart';
import 'package:proton/responsive/web_screen_layout.dart';
import 'package:proton/screens/signup_screen.dart';
import 'package:proton/utils/colors.dart';
import 'package:proton/utils/global_variable.dart';
import 'package:proton/utils/utils.dart';
import 'package:proton/widgets/text_field_input.dart';
//import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

// implements LoginCallBack{
//   BuildContext _ctx;
//   bool _isLoading = false;

//   final formKey = newGlobalKey<FormState>();
//   final scaffoldKey = new GlobalKey<ScaffoldState>();

//   String _username, _password;
//   LoginResponse _response;

//   _LoginScreenState() {
//     _response = new LoginResponse(this);

//   }
// }

  // void _submit() {
  //   final form = formKey.currentState;

  //   if (form.validate()) {
  //     setState(() {
  //       isLoading = true;
  //       form.save();
  //       _response.doLogin(_username, _password);
  //     });
  //   }
  // }
  // void _showSnackBar(String text) {
  //   scaffoldKey.currentState.showSnackbar(new SnackBar(
  //     content: new Text(text),
  //   ));
  // }


  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "HooDrive",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 8,
                  wordSpacing: 20,
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Image.asset(
                'images/1.gif',
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Log in',
                        )
                      : const CircularProgressIndicator(
                          color: primaryColor,
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
                onTap: loginUser,
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Dont have an account?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        ' Signup.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
