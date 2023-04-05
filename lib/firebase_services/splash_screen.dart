
import 'package:flutter/material.dart';
import 'package:untitled3/firebase_services/splash_services.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  splashServices splashscreen= splashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen.isLogin(BuildContext, context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FlutterLogo(size: MediaQuery.of(context).size.height,)
            ],
          )
        ),
      ),
    );
  }
}