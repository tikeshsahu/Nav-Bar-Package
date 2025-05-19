import 'package:flutter/material.dart';
import 'customized_nav_controller.dart';
import 'customized_nav_item.dart';
import 'customized_nav_widget.dart';

class ImageNavBarExample extends StatefulWidget {
  const ImageNavBarExample({super.key});

  @override
  State<ImageNavBarExample> createState() => _ImageNavBarExampleState();
}

class _ImageNavBarExampleState extends State<ImageNavBarExample> {
  int _selectedIndex = 0;
  final _controller = CustomizedNavController();

  // Example pages to display based on selected tab
  final List<Widget> _pages = [
    const _DemoPage(color: Colors.red, title: 'Home'),
    const _DemoPage(color: Colors.green, title: 'Search'),
    const _DemoPage(color: Colors.orange, title: 'Favorites'),
    const _DemoPage(color: Colors.purple, title: 'Profile'),
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
        title: const Text('Image Navigation Bar Example'),
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
          // Example 1: Using PNG images
          CustomizedNavItem.withImages(
            title: 'Home',
            activeImagePath: 'assets/images/home_active.png',
            inactiveImagePath: 'assets/images/home_inactive.png',
          ),

          // Example 2: Using built-in Icons
          CustomizedNavItem.withIcons(
            title: 'Search',
            activeIcon: Icons.search,
            inactiveIcon: Icons.search_outlined,
          ),

          // Example 3: Using SVG icons
          CustomizedNavItem.withSvg(
            title: 'Favorites',
            activeSvgPath: 'assets/icons/heart_filled.svg',
            inactiveSvgPath: 'assets/icons/heart_outline.svg',
          ),

          // Example 4: Using JPG with custom container styling
          CustomizedNavItem.withWidgets(
            title: 'Profile',
            activeIcon: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            inactiveIcon: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: 24,
                height: 24,
                fit: BoxFit.cover,
                color: Colors.grey.withOpacity(0.8),
                colorBlendMode: BlendMode.saturation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Simple demo page widget
class _DemoPage extends StatelessWidget {
  final Color color;
  final String title;

  const _DemoPage({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(0.1),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
