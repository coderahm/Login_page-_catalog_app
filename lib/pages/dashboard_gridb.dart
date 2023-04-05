import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class gridb extends StatefulWidget {
  const gridb({Key? key}) : super(key: key);

  @override
  State<gridb> createState() => _gridbState();
}

class _gridbState extends State<gridb> {

  final List<Map<String, dynamic>> gridMap= [
    {
      "id": 1,
      "name": "Iphone 14",
      "des": "Apple iphone 14 Gen",
      "price": 999,
      "image": "https://media.istockphoto.com/id/1293075683/photo/iphone-12-pro-max-in-pacific-blue.jpg?s=612x612&w=0&k=20&c=vJ6UdT7bj4VP3k2b0ELpoRL4P_KQgnZIwgPdbgS8ud4="
    },
    {
      "id": 2,
      "name": "Ear Buds",
      "des": "Huawei earbuds 7th gen",
      "price": 100,
      "image": "https://www.buykarlo.pk/wp-content/uploads/2021/07/black.jpg"
    },
    {
      "id": 3,
      "name": "Pixel 5",
      "des": "Pixel phone 5th gen",
      "price": 540,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuzd0dNU7FKYwxGEquOD-Kx-o9DnlxmrlI3g&usqp=CAU"
    },
    {
      "id": 4,
      "name": "Airpods",
      "des": "Sony airpods with high Intensity",
      "price": 120,
      "image": "https://www.buykarlo.pk/wp-content/uploads/2021/07/black.jpg"
    },
    {
      "id": 5,
      "name": "Airpods pro",
      "des": "Apple airpods 9th gen",
      "price": 400,
      "image": "https://www.buykarlo.pk/wp-content/uploads/2021/07/black.jpg"
    },
    {
      "id": 6,
      "name": "Samsung S22 ultra",
      "des": "Samsung Phones",
      "price": 720,

      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuzd0dNU7FKYwxGEquOD-Kx-o9DnlxmrlI3g&usqp=CAU"
    },
    {
      "id": 7,
      "name": "OnePlus",
      "des": "One Plus 7th gen",
      "price": 450,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSazaJy2JhfDkQrHgRrJcPDKUO5gPhkEyb3oA&usqp=CAU"
    },
    {
      "id": 8,
      "name": "OnePlus",
      "des": "One Plus 7th gen",
      "price": 430,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSazaJy2JhfDkQrHgRrJcPDKUO5gPhkEyb3oA&usqp=CAU"
    },
    {
      "id": 9,
      "name": "Samsung S22 ultra",
      "des": "Samsung Phones",
      "price": 700,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuzd0dNU7FKYwxGEquOD-Kx-o9DnlxmrlI3g&usqp=CAU"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
          itemCount: gridMap.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 365,
          ),
          itemBuilder: (context, index){
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.network("${gridMap.elementAt(index)['image']}",
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,

                    ),

                    borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${gridMap.elementAt(index)['name']}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        SizedBox(height: 8,),
                        Text("${gridMap.elementAt(index)['des']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                        SizedBox(height: 8,),
                        Text("\$${gridMap.elementAt(index)['price']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            IconButton(icon: Icon(CupertinoIcons.heart),
                              iconSize: 30,
                              onPressed: () {  },),
                            IconButton(icon: Icon(CupertinoIcons.cart),
                              iconSize: 30,
                              onPressed: () {  },),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),

            );
          }
      ),
    );

  }
}