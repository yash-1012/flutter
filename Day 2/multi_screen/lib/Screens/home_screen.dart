import 'package:flutter/material.dart';
import 'package:multi_screen/Screens/order_screen.dart';
import 'package:multi_screen/Screens/product_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext Context){
    return Scaffold(
      appBar: AppBar(title:Text("Home")),
      body:Center(
        child:Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
              Navigator.push( Context, MaterialPageRoute(builder:(context) => ProductScreen(),),);
              }, child: Text("Go to Products"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(Context, MaterialPageRoute(builder:(Context) => OrderScreen()));
              }, child: Text("Go to Order Page")),
            )
          ]
      ),
        )

    );
  }
}