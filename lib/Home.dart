import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  Map data;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  set data(Map<String, dynamic> data) {}
  var userNameController=TextEditingController();
  String id;
  File file;

  @override
  Widget build(BuildContext context) {
    var userNameController=TextEditingController();
    return Scaffold(
      body:
      SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                selectImage();
              },
              child: CircleAvatar(
                backgroundImage:file!=null? FileImage(file):NetworkImage(Data['image']),
                radius: 50,
              ),
            ),
            Text('Rana'),
            Text('Rana@gmail.com'),
            CircleAvatar(
              radius: 50,
              child: Image(
                fit: BoxFit.contain,
                image: NetworkImage('https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),

              ),

            ),
            Container(
              color: Colors.white,
              child: TextButton(
                onPressed: (){
                FirebaseAuth.instance.signOut();
              },
                child: Text('sign out')
                ,
              ),
            ),
            TextFormField(
              controller: userNameController,
            ),
            TextButton(onPressed: (){
              updateInfo(userNameController.text);
            }
            , child: Text(
                  'Update'
                )),
            TextButton(onPressed: (){
              uploadImage();
            }
                , child: Text(
                    'upload Image'.toUpperCase()
                ))

          ],
        ),
      )
    );
  }

  get Data async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    SharedPreferences prefs = await SharedPreferences.getInstance().then((value){
      id = value.getString('userID');
      users.doc('id').snapshots().listen((event) {
        data =event.data();
        setState(() {

        });

      });
    });

  }

  void updateInfo(Name) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Name;
    users.doc(id).update({}).then((value){}).catchError((error){
      print(error.toString());
    });
  }

  void selectImage ()async {
    final f=await ImagePicker().getImage(source: ImageSource.gallery);
    file =File(f.path);
    setState(() {

    });
  }

  uploadImage()async {
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('${file.uri.pathSegments[file.uri.pathSegments.length-1]}')
        .putFile(file).onComplete.then((value)async {
   var url = await value.ref.getDownloadURL().then((value){
     CollectionReference users = FirebaseFirestore.instance.collection('users');
      value.toString();
      users.doc(id).update({}).then((value){}).catchError((error){
     print(error.toString());
   });});

    });
  }


}
