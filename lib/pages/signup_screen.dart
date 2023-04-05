import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/login.dart';
import 'package:untitled3/utils/utilities.dart';

import '../round_button.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool loading= false;

  FirebaseAuth auth= FirebaseAuth.instance;

  final _formkey= GlobalKey<FormState>();

  final emailController= TextEditingController();
  final usernameController= TextEditingController();
  final passwordController= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text("Signup Screen",style: TextStyle(fontSize: 25),),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text("Welcome to Signup Page",style: TextStyle(color: Colors.deepPurple,fontSize: 30),),
                SizedBox(height: 70,),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    else if(value.length > 15){
                      return 'Your username needs to be at most 12 characters';
                    }
                  },
                ),

                SizedBox(height:20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Email cannot be empty";
                    }
                  },
                ),
                SizedBox(height: 20,),

                TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.password),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                  },
                ),

                SizedBox(height: 40,),

                RoundButton(title: "Signup",
                  loading: loading,
                  ontap: () {
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        loading= true;
                      });
                      auth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                      ).then((value){
                       setState(() {
                         loading= false;
                       });

                      }).onError((error, stackTrace){
                         utilities().toastMessage(error.toString());
                         setState(() {
                           loading=false;
                         });
                      });
                    }
                  },
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
                      },
                      child: Text("Login",style: TextStyle(color: Colors.deepPurple,fontSize: 17),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
