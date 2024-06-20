import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Student_Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String skills = txtController.text;

          for (int i = 1; i < txtControllerList.length; i++) {
            skills = skills + " " + txtControllerList[i].text;
          }
          print(skills);

        },
        child: GestureDetector(onTap:(){
          Navigator.of(context).pushNamed('/ad');
        },
        child:Icon(Icons.next_plan)),
      ),
    );
  }
}

TextEditingController txtController = TextEditingController();
List txtControllerList = [
  txtController,
];
