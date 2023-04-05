import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/Dashboard.dart';
import 'package:untitled3/pages/Login_with_phone.dart';
import 'package:untitled3/pages/signup_screen.dart';
import 'package:untitled3/utils/utilities.dart';

import '../round_button.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool loading= false;

  FirebaseAuth auth = FirebaseAuth.instance;

final _formkey= GlobalKey<FormState>();
  final emailController= TextEditingController();
  final passwordController= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void login(){
    setState(() {
      loading = true;
    });
    auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()
    ).then((value){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
         setState(() {
           loading= false;
         });
    }).onError((error, stackTrace){
      utilities().toastMessage(error.toString());
      setState(() {
        loading= false;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text("Login Screen",style: TextStyle(fontSize: 25),),
          automaticallyImplyLeading: false,
        ),
              body: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Text("Welcome to Login Page",style: TextStyle(color: Colors.deepPurple,fontSize: 30),),
                  SizedBox(height: 70,),
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
                  RoundButton(title: "Login",
                     loading: loading,
                    ontap: () {
                      if(_formkey.currentState!.validate());
                      login();
                    },
                  ),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                            },
                            child: Text("Signup",style: TextStyle(fontSize: 17,color: Colors.deepPurple),),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginwithPhone()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black,
                            )
                          ),
                          child: Center(child: Text("Login With Phone No",
                            style: TextStyle(color: Colors.deepPurple,fontSize: 18),)),
                        ),
                      ),
        ],
          ),
                ),
              ),
        ),
    );
  }
}
