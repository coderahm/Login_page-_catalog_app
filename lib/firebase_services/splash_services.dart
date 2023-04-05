import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/login.dart';

import '../pages/Dashboard.dart';

class splashServices {

  void isLogin(BuildContext, context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if (user != null) {
      Timer(Duration(seconds: 10), () => Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard())));
    } else {
      Timer(Duration(seconds: 10), () => Navigator.push(context, MaterialPageRoute(builder: ((context) => Loginpage()))));
    }
  }
}
