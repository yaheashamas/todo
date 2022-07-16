import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wael_abo_kalam/screens/home.dart';
import 'package:firebase_wael_abo_kalam/widgets/custom_button.dart';
import 'package:firebase_wael_abo_kalam/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AwesomeDialog(
        context: context,
        title: "success",
        padding: const EdgeInsets.all(8.0),
        body: const Text("create user successfully"),
      )..show();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          title: "Error",
          padding: const EdgeInsets.all(8.0),
          body: const Text("The password provided is too weak"),
        )..show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          padding: const EdgeInsets.all(8.0),
          title: "Error",
          body: const Text("The account already exists for that email."),
        )..show();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 20,
              left: 20,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomtextFormField(
                    controller: emailController,
                    text: "email",
                    iconData: Icons.email,
                    textInputType: TextInputType.emailAddress,
                    isSecure: false,
                    enabled: true,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "dont can send this value empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomtextFormField(
                    controller: passwordController,
                    text: "password",
                    iconData: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    isSecure: false,
                    enabled: true,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "dont can send this value empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Register",
                    width: double.infinity,
                    color: Colors.blue,
                    function: () async {
                      if (formKey.currentState!.validate()) {
                        await loginUser(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                      } else {
                        print("not valid");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
