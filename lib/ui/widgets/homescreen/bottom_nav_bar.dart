import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedTab;
  final Function(int) onTabChange;

  const BottomNavBar(
      {super.key, required this.selectedTab, required this.onTabChange});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedTab,
        onTap: widget.onTabChange,
        selectedItemColor: Colors.blue,
        elevation: 50,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'KD Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'KD Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
