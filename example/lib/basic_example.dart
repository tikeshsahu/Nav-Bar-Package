import 'package:flutter/material.dart';
import 'package:navigation_bar/navigation_bar.dart';
import 'package:navigation_bar_example/demo_page.dart';


class BasicExample extends StatefulWidget {
  const BasicExample({super.key});

  @override
  State<BasicExample> createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  int _selectedIndex = 0;
  final _controller = CustomNavBarController();

  // Example pages to display based on selected tab
  final List<Widget> _pages = [
    const DemoPage(color: Colors.blue, title: 'Home'),
    const DemoPage(color: Colors.teal, title: 'Search'),
    const DemoPage(color: Colors.amber, title: 'Notifications'),
    const DemoPage(color: Colors.indigo, title: 'Settings'),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.currentIndex;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Navigation Bar Example'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        controller: _controller,
        onItemSelected: (index) {
          // Controller already handles the state change
        },
        initialSelectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          CustomNavBarItem.withIcons(
            title: 'Home',
            activeIcon: Icons.home,
            inactiveIcon: Icons.home_outlined,
          ),
          CustomNavBarItem.withIcons(
            title: 'Search',
            activeIcon: Icons.search,
            inactiveIcon: Icons.search_outlined,
          ),
          CustomNavBarItem.withIcons(
            title: 'Alerts',
            activeIcon: Icons.notifications,
            inactiveIcon: Icons.notifications_outlined,
          ),
          CustomNavBarItem.withIcons(
            title: 'Settings',
            activeIcon: Icons.settings,
            inactiveIcon: Icons.settings_outlined,
          ),
        ],
      ),
    );
  }
}