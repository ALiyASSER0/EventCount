import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tasks_details.dart';

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: TasksDetails(),
      
    );
  }
}