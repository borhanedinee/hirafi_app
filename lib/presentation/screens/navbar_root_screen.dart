import 'package:flutter/material.dart';
import 'package:hirafi/presentation/screens/artisan_screens/add_offer_by_artisan_screen.dart';
import 'package:hirafi/presentation/screens/client_screens/choose_offer_type_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/conversations_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/home_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/prodile_views/client_profile_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/profile_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/search_screen.dart';
import 'package:ionicons/ionicons.dart';

class NavBarRootScreen extends StatefulWidget {
  NavBarRootScreen({super.key, required this.isArtisan});

  final bool isArtisan;

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        isArtisan: widget.isArtisan,
      ),
      SearchScreen(),
      ConversationsScreen(),
      ProfileScreen(
        isArtisan: widget.isArtisan,
      ),
    ];

    print(widget.isArtisan);

    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFAB(context),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.isArtisan
                  ? AddOfferByArtisanScreen()
                  : ChooseOfferTypeScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
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
