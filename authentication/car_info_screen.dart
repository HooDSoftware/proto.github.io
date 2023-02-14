import 'package:proton/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../splashScreen/splash_screen.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  List<String> carTypesList = ['car', 'truck', 'bike', 'yatch'];
  String? selectedCarType;

  saveCarInfo() {
    Map driverCarInfoMap = {
      'car_color': carColorTextEditingController.text.trim(),
      'car_number': carNumberTextEditingController.text.trim(),
      'car_model': carModelTextEditingController.text.trim(),
      'type': selectedCarType,
    };
    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child('drivers');
    driversRef
        .child(currentFirebaseUser!.uid)
        .child('car_details')
        .set(driverCarInfoMap);

    Fluttertoast.showToast(msg: 'Car details have been saved.');
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/3.gif',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Car Details',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: carModelTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Car Model',
                  hintText: 'Car Model',
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
                controller: carNumberTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Car Number',
                  hintText: 'Car Number',
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
                controller: carColorTextEditingController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  labelText: 'Car Color',
                  hintText: 'Car Color',
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
              DropdownButton(
                iconSize: 20,
                icon: const Icon(Icons.car_rental_rounded),
                dropdownColor: Colors.black45,
                hint: const Text(
                  'please choose car type',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue) {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
                items: carTypesList.map((car) {
                  return DropdownMenuItem(
                    value: car,
                    child: Text(
                      car,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (carColorTextEditingController.text.isNotEmpty &&
                      carNumberTextEditingController.text.isNotEmpty &&
                      carModelTextEditingController.text.isNotEmpty &&
                      selectedCarType != null) {
                    saveCarInfo();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text(
                  'Save Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
