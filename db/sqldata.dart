

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SqlData extends StatefulWidget {
  const SqlData({super.key});

  @override
  State<SqlData> createState() => _SqlDataState();
}

class _SqlDataState extends State<SqlData> {

  final TextEditingController namectl = TextEditingController();
  final TextEditingController emailctl = TextEditingController();
  final TextEditingController numberctl = TextEditingController();
  final TextEditingController carColorctl = TextEditingController();
  final TextEditingController carChoicectl = TextEditingController();
  final TextEditingController carPlatectl = TextEditingController();
  final TextEditingController UIDctl = TextEditingController();
  final TextEditingController passwordctl = TextEditingController();

  late bool error, sending, success;
  late String msg;

  String phpurl = "http//192.168.122.1/database";
  // static const hostConnectUser = "$hostConnect/user ";

  // static const signUp = "$hostConnect/user/signup.php";

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {
    var res = await http.post(Uri.parse(phpurl), body: {
      "name": namectl.text,
      "email": emailctl.text,
      "number": numberctl.text,
      "carColor": carColorctl.text,
      "carChoice": carChoicectl.text,
      "carPlate": carPlatectl.text,
      "UId": UIDctl.text,
      "password": passwordctl.text,
    });

    if (res.statusCode == 200) {
      print(res.body);

      var data = json.decode(res.body);
      
      if (data["error"]) {
        setState(() {
          sending = false;
          error = true;
          msg = data["message"];
        });
      } else {
        namectl.text = "";
        emailctl.text = "";
        numberctl.text = "";
        carColorctl.text = "";
        carChoicectl.text = "";
        carPlatectl.text = "";
        UIDctl.text = "";
        passwordctl.text = "";

        setState(() {
          error = true;
          msg = "Error while sending data";
          sending = false;
          success = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
