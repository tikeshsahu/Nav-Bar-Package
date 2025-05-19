import 'package:customized_nav/customized_nav.dart';
import 'package:flutter/material.dart';
import 'package:custom_nav_bar_example/demo_page.dart';

class StylesExample extends StatefulWidget {
  const StylesExample({super.key});

  @override
  State<StylesExample> createState() => _StylesExampleState();
}

class _StylesExampleState extends State<StylesExample> {
  int _selectedIndex = 0;
  final _controller = CustomizedNavController();

  // Example pages to display based on selected tab
  final List<Widget> _pages = [
    const DemoPage(color: Colors.red, title: 'Home'),
    const DemoPage(color: Colors.green, title: 'Search'),
    const DemoPage(color: Colors.orange, title: 'Favorites'),
    const DemoPage(color: Colors.purple, title: 'Profile'),
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
        title: const Text('Styled Icons Example'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomizedNavBar(
        controller: _controller,
        onItemSelected: (index) {
          // Controller already handles the state change
        },
        initialSelectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: Colors.red,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          // Example 1: Simple icon variant
          CustomizedNavItem.withIcons(
            title: 'Home',
            activeIcon: Icons.home,
            inactiveIcon: Icons.home_outlined,
          ),

          // Example 2: Different icon style
          CustomizedNavItem.withIcons(
            title: 'Search',
            activeIcon: Icons.search,
            inactiveIcon: Icons.search_outlined,
          ),

          // Example 3: Using custom widget for more control
          CustomizedNavItem.withWidgets(
            title: 'Favorites',
            activeIcon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            inactiveIcon: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ),

          // Example 4: Using custom container with an icon
          CustomizedNavItem.withWidgets(
            title: 'Profile',
            activeIcon: Container(
              padding: const EdgeInsets.all(2),
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   border: Border.all(color: Colors.red, width: 2),
              // ),
              child: const Icon(
                Icons.person,
                color: Colors.red,
                size: 18,
              ),
            ),
            inactiveIcon: const Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
