import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation/Register.dart';
import 'package:graduation/onBoarding.dart';
import 'Ay7aga.dart';
import 'Home.dart';
import 'Login.dart';
import 'Screens.dart';
import 'Setting.dart';
bool isUser =false;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(
  FirebaseAuth.instance.currentUser !=null)
    isUser=true;
  runApp(MyApp(isUser));
}
class MyApp extends StatelessWidget {
  bool darkMode=false;
  final bool isUser;
  MyApp(this.isUser);
  ThemeData dark = ThemeData(brightness: Brightness.dark);
  ThemeData light = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                bodyText1: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black)
            ),
            backgroundColor: Colors.black26,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black26,
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white
          )

        ),
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white)

        ),
        scaffoldBackgroundColor: Colors.grey[800],
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[800]
            ),
      ),
      themeMode: ThemeMode.system,


      home:Setting()

    );
  }
}


