import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/verify_code_screen.dart';
import 'package:untitled3/round_button.dart';
import 'package:untitled3/utils/utilities.dart';
class LoginwithPhone extends StatefulWidget {
  const LoginwithPhone({Key? key}) : super(key: key);

  @override
  State<LoginwithPhone> createState() => _LoginwithPhoneState();
}

class _LoginwithPhoneState extends State<LoginwithPhone> {
bool loading = false;
final phoneNumberController = TextEditingController();
  final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Login"),
       // automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 60,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: '+1 335 4144 399',
              ),
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: RoundButton(title: "login",
              loading: loading,
              ontap: () {
                setState(() {
                  loading= true;
                });
                auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                    verificationCompleted: (context){
                      setState(() {
                        loading= false;
                      });
                    },
                    verificationFailed: (e){
                    utilities().toastMessage(e.toString());
                    setState(() {
                      loading= false;
                    });
                    },
                    codeSent: (String verificationId, int? token){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> verifyScreen(verificationId: verificationId,)));
                        setState(() {
                          loading= false;
                        });
                    },
                    codeAutoRetrievalTimeout: (e){
                    utilities().toastMessage(e.toString());
                    setState(() {
                      loading= false;
                    });
                    }
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
