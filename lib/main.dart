import 'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/firebase_services/splash_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await Firebase.initializeApp();
  runApp(untitled3());

}
class untitled3 extends StatelessWidget {
  const untitled3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Splashscreen(),
    );
  }
}

