import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/drawer.dart';
import 'package:untitled3/pages/login.dart';

import '../utils/utilities.dart';
import 'dashboard_gridb.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List imageList= [
    {"id": 1 , "image_path": "assets/images/redmi.jpg"},
    {"id": 2 , "image_path": "assets/images/iphone.jpg"},
    {"id": 3 , "image_path": "assets/images/samsung.jpg"},
    {"id": 4 , "image_path": "assets/images/headphone.jpg"},
  ];


  final CarouselController carouselSlider= CarouselController();
  final auth = FirebaseAuth.instance;
 int currentindex= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
       // automaticallyImplyLeading: false,
        title: Text("Dashboard",style: TextStyle(fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout_outlined), onPressed: () {
            auth.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Loginpage())));
            }).onError((error, stackTrace){
              utilities().toastMessage(error.toString());
            });
          },)
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30,),
              backgroundColor: Colors.cyan,
              label: 'home'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search,size: 30,),
            label: 'search',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: 'profile',
           backgroundColor: Colors.orange,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.wallet,size: 30,),
            label: 'wallet',
           backgroundColor: Colors.blue,
          ),


        ],
        onTap: (index){
          setState(() {
            currentindex= index;
          });
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            SafeArea(
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) =>
                      Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                      ),
                ).toList(),
                carouselController: CarouselController(),
                options:CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: gridb(),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
