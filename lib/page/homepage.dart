import 'package:flutter/material.dart';
import 'package:flutterfirebase/page/signin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
