import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'Home.dart';
import 'Screens.dart';

class LogIn extends StatefulWidget {

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  bool _secureText=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body:
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.teal,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Form(
                  child: Column(
                    children: [
                      Center(
                        child: Text('LogIn',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              suffixIcon: Icon(
                                Icons.account_box,
                                color: Colors.teal,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:BorderRadius .circular(30)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType:TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.teal,
                              ),
                              suffixIcon:IconButton(

                                onPressed: (){
                                  setState(() {
                                    _secureText= !_secureText;
                                  });

                                },
                                icon: Icon(
                                  _secureText? Icons.visibility:Icons.visibility_off
                                ,
                                ),
                              ) ,
                              border: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(30),
                              )
                          ),
                          obscureText: _secureText,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          width: double.infinity,
                          child:
                          MaterialButton(
                            onPressed: (){
                              createUser(emailController.text, passwordController.text,context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeLayout()));

                            },

                            child: Text('Login',style: TextStyle(color: Colors.white),),),
                        ),
                      ),
                      // TextButton(onPressed:(){}, child:
                      // Text('You don\'t have account',
                      //   style: TextStyle(
                      //       color: Colors.teal
                      //   ),
                      // )),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                        },
                          child: Text('Don\'t have account'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void createUser(email,password,context)async
  {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) async
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', value.user.uid).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      });


    }).catchError((e)
    {
      Toast.show(e.toString(), context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      print (e.toString());


      });

  }
}
