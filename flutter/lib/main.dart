import 'package:flutter/material.dart';
import 'plist.dart';

void main() {
  runApp(const MaterialApp(title: 'Navigation Basics', home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context,forward,backward)=>const Plist()
              )
            );
          },
          child:Text('Hello World!',style: TextStyle(color: Color(0xFF000000)))
        )
      )
    )
  );
}
