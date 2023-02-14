

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/foundation.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
final database = FirebaseDatabase.instance;


User? currentFirebaseUser;
