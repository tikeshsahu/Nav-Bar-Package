# Custom Navigation Bar

A highly customizable bottom navigation bar for Flutter applications with support for different icon types (IconData, SVG, or custom widgets), animations, and responsive design.

## Features

📱 Works on iOS, Android, and other platforms
🎨 Fully customizable appearance (colors, sizes, animations)
🖼️ Support for multiple icon types (IconData, SVG, or custom widgets)
⚡ Smooth animations with customizable duration and curve
📐 Responsive design that adapts to different screen sizes
🧩 Simple integration with any state management solution
🔍 Indicator line for the selected item with customizable appearance

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  customized_nav: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:customized_nav/customized_nav.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selected tab: $_selectedIndex'),
      ),
      bottomNavigationBar: CustomizedNavBar(
        items: [
          CustomizedNavItem.withIcons(
            title: 'Home',
            activeIcon: Icons.home,
            inactiveIcon: Icons.home_outlined,
          ),
          CustomizedNavItem.withIcons(
            title: 'Search',
            activeIcon: Icons.search,
            inactiveIcon: Icons.search_outlined,
          ),
          CustomizedNavItem.withIcons(
            title: 'Profile',
            activeIcon: Icons.person,
            inactiveIcon: Icons.person_outlined,
          ),
          CustomizedNavItem.withIcons(
            title: 'Settings',
            activeIcon: Icons.settings,
            inactiveIcon: Icons.settings_outlined,
          ),
        ],
        initialSelectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
```

## Platform Support

| Android | iOS | Web | macOS | Windows | Linux |
| ------- | --- | --- | ----- | ------- | ----- |
| ✅      | ✅  | ✅  | ✅    | ✅      | ✅    |

## Examples

For more examples, check the [example](https://github.com/tikeshsahu/Nav-Bar-Package.git) directory in the repository.

## Contributing

Contributions are welcome! If you find a bug or want a feature, please open an issue.

If you'd like to contribute, please fork the repository and make changes as you'd like. Pull requests are warmly welcome.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
