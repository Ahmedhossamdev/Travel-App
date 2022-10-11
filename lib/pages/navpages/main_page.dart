import 'package:flutter/material.dart';
import 'package:travel/pages/navpages/bar_item_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/navpages/my_page.dart';
import 'package:travel/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  @override
  int currIndex  = 0 ;
  void onTap(int index){
       setState(() {
         currIndex = index;
       });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currIndex], // HomePage
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
               label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp),
              label: 'Bar'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
