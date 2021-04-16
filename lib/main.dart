import 'package:flutter/material.dart';

import 'courseinfo/CourseInfo.dart';
import 'home/Home.dart';
import 'member/Member.dart'; // android 樣式

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          bottomAppBarColor: Colors.brown,
          buttonTheme: ButtonThemeData(minWidth: double.infinity, height: 50)),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int count = 0;
  // navbar點擊的頁面
  int pageIndex = 0;

  final pages = [
    Home(),
    CourseInfo(),
    Member()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁' ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '課程' ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '會員中心' ),
        ],
        backgroundColor: Colors.grey[800],
        unselectedItemColor: Colors.white,
        fixedColor: Colors.amber, //選擇頁顏色
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}


