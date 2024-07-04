import 'package:flutter/material.dart';
import 'package:out_rate/themes/colors.dart';

import '../view/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(String assetName, int index) {
    bool isSelected = _selectedIndex == index;
    return Image.asset(
      assetName,
      height: 24,
      width: 24,
      color: isSelected ? Colors.black : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          Container(
            child: Text('Podium'),
          ),
         Container(), // Placeholder for the middle button
          Container(
            child: Text('Messages'),
          ),
          Container(
            child: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: _buildIcon('assets/icons/home_unselected.png', 0),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: _buildIcon('assets/icons/podium_unselected.png', 1),
                  onPressed: () => _onItemTapped(1),
                ),
                SizedBox(width: 48), // Space for the middle button
                IconButton(
                  icon: _buildIcon('assets/icons/message_unselected.png', 2),
                  onPressed: () => _onItemTapped(3),
                ),
                IconButton(
                  icon: _buildIcon('assets/icons/profile_unselected.png', 3),
                  onPressed: () => _onItemTapped(4),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {
                // Handle middle button press
              },
              backgroundColor:primaryColor,
              child: Image.asset('assets/icons/add_icon.png', height: 24, width: 24, ),
              //child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
