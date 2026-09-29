import 'package:flutter/material.dart';
import 'package:lat_kuis/views/home.dart';
import 'package:lat_kuis/views/profile.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [const HomePage(), const ProfilePage()];
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
