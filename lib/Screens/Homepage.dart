import 'dart:ffi';
import 'dart:math';

import 'package:exam_core_flutter/utils/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/list.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Homepage', style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: GestureDetector(onTap: () {
        Navigator.of(context).pushNamed('/dt');
      },
        child: ListView.builder(
            itemBuilder: (context, index) => Card(
              color: colorList[index % colorList.length],
              child: Column(children: [
                ListTile(
                  title: Text('${sList[index]['name']}'),
                  subtitle: Text('${sList[index]['GRID']}'),
                  trailing: Text('${sList[index]['Std']}'),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.add_outlined),),
                  ],
                ),
              ],),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // no++;
          });
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: GestureDetector(onTap:(){
                      Navigator.of(context).pushNamed('/dt');
                     },
                    child: Text('Add students details')),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('back'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
List colorList=[
  Colors.blueGrey,

];
