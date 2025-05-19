import 'package:flutter/material.dart';
import 'custom_nav_bar_controller.dart';
import 'custom_nav_bar_item.dart';

class CustomNavBar extends StatefulWidget {
  final CustomNavBarController? controller;
  final Function(int)? onItemSelected;
  final int initialSelectedIndex;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final List<CustomNavBarItem> items;

  const CustomNavBar({
    super.key,
    this.controller,
    this.onItemSelected,
    this.initialSelectedIndex = 0,
    this.backgroundColor = Colors.white,
    this.indicatorColor = Colors.blue,
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.grey,
    required this.items,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late CustomNavBarController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? CustomNavBarController();
    _selectedIndex = widget.initialSelectedIndex;
    _controller.changeIndex(value: _selectedIndex);
    _controller.addListener(_onControllerChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      // Only dispose the controller if it was created internally
      _controller.dispose();
    } else {
      _controller.removeListener(_onControllerChange);
    }
    super.dispose();
  }

  void _onControllerChange() {
    if (_selectedIndex != _controller.currentIndex) {
      setState(() {
        _selectedIndex = _controller.currentIndex;
      });
    }
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _controller.changeIndex(value: index);
      widget.onItemSelected?.call(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 15,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildNavItems(),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return List.generate(widget.items.length, (index) {
      final item = widget.items[index];
      final isSelected = index == _selectedIndex;

      return InkWell(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The indicator dot for the active item
            Container(
              height: 3,
              width: 30,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: isSelected ? widget.indicatorColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // The icon - different depending on selected state
            SizedBox(
              height: 24,
              width: 24,
              child: isSelected
                  ? item.buildActiveIcon()
                  : item.buildInactiveIcon(),
            ),
            const SizedBox(height: 4),
            // The label text
            Text(
              item.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? widget.selectedItemColor
                    : widget.unselectedItemColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}
