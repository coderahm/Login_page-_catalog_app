import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class verifyScreen extends StatefulWidget {
  final String verificationId;
  const verifyScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<verifyScreen> createState() => _verifyScreenState();
}

class _verifyScreenState extends State<verifyScreen> {
  final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Verify"),
    // automaticallyImplyLeading: false,
    ),
    body: Column(
    children: []
    ),
    );
    }
}