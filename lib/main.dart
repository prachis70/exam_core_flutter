import 'package:exam_core_flutter/Screens/Addpage.dart';
import 'package:exam_core_flutter/Screens/Detailspage.dart';
import 'package:exam_core_flutter/Screens/Homepage.dart';
import 'package:exam_core_flutter/Screens/finalpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Home_page(),
        '/dt':(context)=>Details(),
        '/ad':(context)=>Addpage(),
        '/fn':(context)=>finalpage(),
      },
    );
  }
}
