import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List UserList = [];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) =>
                buildUserItem(context, UserList[index]),
            separatorBuilder: (context, index) =>
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[200],
                ),
            itemCount: UserList.length)
    );
  }

  Widget buildUserItem(context, User) =>
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(User['image']),
              radius: 30,
            ),
            SizedBox(
              width: 10,

            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(User['username'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(User['email']),

                ],
              ),
            )
          ],
        ),
      );
// getData() async {
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//     users.snapshots().listen((value)
//     {
//       UserList=value.docs;
//       setState(() {
//
//       });
//     });
// }}

//   getData()async {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     users.snapshots().listen((value)
//     {
//       UserList=value.docs;
//       setState(() {
//
//       });
//   }});
}// }}
