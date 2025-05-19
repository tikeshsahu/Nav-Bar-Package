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
  custom_nav_bar: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:custom_nav_bar/custom_nav_bar.dart';
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
      bottomNavigationBar: CustomNavBar(
        items: [
          NavBarItem(icon: Icons.home, label: 'Home'),
          NavBarItem(icon: Icons.search, label: 'Search'),
          NavBarItem(icon: Icons.person, label: 'Profile'),
          NavBarItem(icon: Icons.settings, label: 'Settings'),
        ],
        selectedIndex: _selectedIndex,
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
