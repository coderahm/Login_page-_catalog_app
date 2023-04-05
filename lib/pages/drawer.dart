import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl= "https://media.istockphoto.com/id/458250423/photo/red-range-rover-evoque-2012-front-view.jpg?s=612x612&w=0&k=20&c=zV80luuv0xh_RAdHYogsFpvZcSlyDvkKbX-XCHgpVhM=";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              margin: EdgeInsets.zero,
              accountName: Text("ahmad ali raza"),
              accountEmail: Text("ahmadrazauol678@gmail.com"),
              currentAccountPicture: Image.network(imageurl),
            ),

          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Home",style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
          ),

          ListTile(
            leading: Icon(CupertinoIcons.airplane),
            title: Text("Connect",style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
          ),

          ListTile(
            leading: Icon(CupertinoIcons.question),
            title: Text("About",style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}