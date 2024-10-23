import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_event_app/pages/event_page.dart';
import 'package:my_event_app/pages/favorites.dart';
import 'package:my_event_app/pages/profile.dart';
import 'package:my_event_app/pages/stat/statglobal.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    EventPage() ,
    GlobalStat(),
    ProfilePage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            duration: Duration(milliseconds: 700),
            haptic: true,
            backgroundColor: Colors.black,
            gap: 15,
            color: Colors.white,
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: const Color.fromARGB(255, 28, 37, 136),
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.event_available_outlined,
                text: 'Event',
              ),
              GButton(
                icon: Icons.query_stats ,
                text: 'Statistique',
              ),
              GButton(
                icon: Icons.verified_user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
