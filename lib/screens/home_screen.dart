import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.person,
  ];

  final List<Widget> _pages = [
    HomeContent(),
    ProfileScreen(),
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_bottomNavIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        backgroundColor: Colors.white12,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        onTap: _onBottomNavTap,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isBlack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isBlack ? Colors.white : Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: isBlack ? Colors.white : Colors.black,
        foregroundColor: isBlack ? Colors.black : Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini halaman Utama',
              style: TextStyle(
                fontSize: 24,
                color: isBlack ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBlack = !isBlack;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isBlack ? Colors.black : Colors.white,
                foregroundColor: isBlack ? Colors.white : Colors.black,
              ),
              child: const Text('Ganti Background'),
            ),
          ],
        ),
      ),
    );
  }
}
