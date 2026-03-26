import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test Api')),
        body: FutureBuilder(
  future: fetchPost(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } 
    else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } 
    else {
      final data = snapshot.data ?? [];

      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]['title']),
          );
        },
      );
    }
  },
),
      ),
    );
  }
  
}

Future<List> fetchPost() async{
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode ==200){
    return json.decode(response.body);
  }else{
    throw Exception('Failed to load data');
  }
}

