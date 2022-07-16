import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_wael_abo_kalam/screens/home.dart';
import 'package:firebase_wael_abo_kalam/screens/login.dart';
import 'package:flutter/material.dart';

late bool isLogIn;

void main() async {
  //make async to all funcation then run class MyApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  user != null ? isLogIn = true : isLogIn = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogIn ? HomeScreen() : LoginScreen(),
    );
  }
}
