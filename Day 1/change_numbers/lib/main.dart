import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),      
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 50;

  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Change Numbers'),
        backgroundColor: Colors.deepPurple,
        // titleTextStyle: TextStyle(color: Colors.white),
        foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(15.0),
                child: Text(number.toString(),
                style: TextStyle(fontSize: 24),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(onPressed: (){}, child: Text('Prev')),
                  ),
                  Padding(padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(onPressed: (){}, child: Text('Next')),)
                ],
              )
            ],
          ),
        ),
      );
  }
}
