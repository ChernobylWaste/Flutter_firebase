import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/page/forgetpw.dart';
import 'package:flutterfirebase/page/homepage.dart';
import 'package:flutterfirebase/page/signup.dart';
import 'package:flutterfirebase/reusable_widgets/reusable_widgets.dart';
import 'package:flutterfirebase/utils/color.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: [
                  logoWidget("assets/icon.png"),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email", Icons.person_outline,
                      false, _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  SizedBox(
                    height: 20,
                  ),
                  SignInSignUpButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  SignUpOption(context),
                  SizedBox(
                    height: 20,
                  ),
                  ForgotPW(context),
                ],
              ),
            ),
          )),
    );
  }
}

Row SignUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account?",
          style: TextStyle(
              color: Colors.white70, decoration: TextDecoration.none)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

Row ForgotPW(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ForgetPW()));
        },
        child: const Text(
          " Forgot Password?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
