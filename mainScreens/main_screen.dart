import 'package:flutter/material.dart';


import '../tabPages/earning_tab.dart';
import '../tabPages/home_tab.dart';
import '../tabPages/profile_tab.dart';
import '../tabPages/ratings_tab.dart';
//import '../tabPages/map.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});



  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:TabBarView(

        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children:const [
          HomeTabPage(),
          EarningsTabPage(),

          RatingsTabPage(),
          ProfileTabPage(),
          //MapTabPage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max),
              label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Earnings',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Ratings',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'maps',
          ),
        ],
        unselectedItemColor:Colors.white54,
        selectedItemColor:Colors.orange,
        backgroundColor:Colors.black,
        type:BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        currentIndex: selectedIndex,
        onTap:onItemClicked,

      ),
    );
  }
}




