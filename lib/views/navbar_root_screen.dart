import 'package:flutter/material.dart';
import 'package:hirafi/views/add_service_screens/service_type_screen.dart';
import 'package:hirafi/views/navbar_screens/chats_screen.dart';
import 'package:hirafi/views/navbar_screens/home_screen.dart';
import 'package:hirafi/views/navbar_screens/profile_screen.dart';
import 'package:hirafi/views/navbar_screens/search_screen.dart';
import 'package:ionicons/ionicons.dart';

class NavBarRootScreen extends StatefulWidget {
  NavBarRootScreen({super.key});

  @override
  State<NavBarRootScreen> createState() => _NavBarRootScreenState();
}

class _NavBarRootScreenState extends State<NavBarRootScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    // Handle item tap
    _currentIndex = index;
    setState(() {});
  }

  final List<Widget> pages = [
    HomeScreen(),
    ChatsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          // Handle floating action button press
          // For example, navigate to a new screen or show a dialog
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChooseOfferTypeScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Ionicons.home_sharp), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Ionicons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Ionicons.person), label: 'Profile'),
      ],
    );
  }
}
