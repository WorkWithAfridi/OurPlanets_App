//@dart=2.9
import 'package:flutter/material.dart';
import 'home_page.dart';


void main(){
  runApp(MyAPP());
}
class MyAPP extends StatelessWidget {
  //root of application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OurPlanets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
