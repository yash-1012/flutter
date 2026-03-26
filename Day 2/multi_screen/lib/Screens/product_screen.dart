import 'package:flutter/material.dart';
import 'package:multi_screen/Screens/order_screen.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Products"),),
      body: Center(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("This is Product Screen"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push( context, MaterialPageRoute(builder: (context)=>OrderScreen()));
              }, child: Text("Go To Order Page")),
            )
          ]
        )
        

      ),

      );
  }
}