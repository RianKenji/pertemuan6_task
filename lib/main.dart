import 'package:flutter/material.dart';
import 'package:pertemuan6/views/plan_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: PlanScreen(),
    );
  }
}
