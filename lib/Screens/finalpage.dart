import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Addpage.dart';

class finalpage extends StatefulWidget {
  const finalpage({super.key});

  @override
  State<finalpage> createState() => _finalpageState();
}

class _finalpageState extends State<finalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
                image: (fileImage != null)
                    ? DecorationImage(
                    image: FileImage(fileImage!), fit: BoxFit.cover)
                    : null,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () async {
                    XFile? xfileImage =
                    await imagePicker.pickImage(source: ImageSource.camera);
                    setState(() {
                      fileImage = File(xfileImage!.path);
                    });
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    size: 30,
                  )),
              IconButton(
                onPressed: () async {
                  XFile? xfileImage =
                  await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    fileImage = File(xfileImage!.path);
                  });
                },
                icon: Icon(
                  Icons.photo,
                  size: 30,
                ),
              )
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 270,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                  color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                              ' Students_details',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),

                      //
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              TextEditingController txtController =
                              TextEditingController();
                              setState(() {
                                txtControllerList.add(txtController);
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                      color: Colors.grey)
                                ],
                              ),
                              child: Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                    txtControllerList.length,
                        (index) => ListTile(
                      title: TextField(
                        controller: txtControllerList[index],
                        decoration: InputDecoration(
                          hintText:
                          'Enter students names',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 3)),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
