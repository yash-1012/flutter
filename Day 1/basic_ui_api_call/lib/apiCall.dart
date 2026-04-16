import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apicall extends StatelessWidget{
  // const Apicall({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('API page'),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Go To HomePage')),
          FutureBuilder(future: fetchPost(), builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if (snapshot.hasError){
              return Text('Error:${snapshot.error}');
            }else{
              final posts = snapshot.data!;

              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(posts[index]['title']),
                        subtitle: Text(posts[index]['body']),
                      ),
                    );
                  },
                ),
              );
            } 
            }),
        ],
      )
    );
  } // build context
} // class Apicall

// Fetch Api Data
Future<List> fetchPost() async{
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts')
  );

  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }else{
    throw Exception('Failed to load posts');
  }
}
