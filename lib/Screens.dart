import 'package:flutter/material.dart';
import 'package:graduation/Home.dart';
import 'package:graduation/Users.dart';
import 'package:graduation/chats.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens=[
    UsersScreen(),
    ChatsScreen(),
    HomeScreen(),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: screens[currentIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try{
            var name = await getName();
            print(name);
            throw('some errors!!!!!');
          } catch(Error){
            print('Error ${Error.toString()}');

          }

        },
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index; });
          print(index);
        },
        items: [
          BottomNavigationBarItem(icon:
          Icon(
            Icons.list,
          ),
              label: 'Users'
          ),
          BottomNavigationBarItem(icon:
          Icon(
            Icons.chat,
          ),
              label: 'Chats'
          ),
          BottomNavigationBarItem(icon:
          Icon(
            Icons.person,
          ),
              label: 'Profile'
          ),

        ]
        ,),
    );
  }
  Future<String>getName()async
  {
    return'Rana Elsharawy';
  }
}

