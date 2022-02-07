import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController=TextEditingController();
  var PhoneController=TextEditingController();
  var emailController=TextEditingController();
  var PasswordController=TextEditingController();
  var confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 150,horizontal: 10),
            // padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius .circular(10)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.account_box,
                            color: Colors.teal,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius .circular(10)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: PhoneController,
                      decoration: InputDecoration(
                          suffixIcon:Icon (
                            Icons.call,
                            color:Colors.teal ,

                          ),
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius .circular(10)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: PasswordController,
                      keyboardType:TextInputType.visiblePassword,
                      obscureText: true,

                      decoration: InputDecoration(
                          labelText: 'Password',
                          // prefixIcon: Icon(
                          //   Icons.lock,
                          //   color: Colors.teal,
                          // ),
                          suffixIcon:Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.teal,
                          ) ,
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      keyboardType:TextInputType.visiblePassword,
                      obscureText: true,

                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          // prefixIcon: Icon(
                          //   Icons.lock,
                          //   color: Colors.teal,
                          // ),
                          suffixIcon:Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.teal,
                          ) ,
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      width: double.infinity,
                      child:
                      MaterialButton(
                        onPressed: (){
                          createUser(usernameController.text, PhoneController.text, emailController.text, PasswordController.text, confirmPasswordController.text, context);

                        },
                        child: Text(
                          'Create Account',
                        ),),
                    ),
                  ),

                ],
              ),




            ),
          ),
        ),
      ),
    );
  }
  void createUser(Username,phone,email,password,confirmpassword,context)async{
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)
    async {
      var id = value.user.uid;
      SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', value.user.uid).then((value){
      addUser(Username,email,id);
    });



    }).catchError((e)
    {
      Toast.show(e.toString(), context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      print (e.toString());


    });

  }

  void addUser(username, email,uid) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(email).set({
      'username':username,
      'email':email,
    }).then((value) => {}).catchError((e){
      print(e.toString());
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
}
