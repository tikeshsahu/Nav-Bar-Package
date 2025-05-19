import 'package:flutter/material.dart';
import 'package:custom_nav_bar_example/basic_example.dart';
import 'package:custom_nav_bar_example/style_example.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nav Bar Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StylesExample(),
                  ),
                );
              },
              child: const Text('Styled Icons Example'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicExample(),
                  ),
                );
              },
              child: const Text('Basic Nav Bar Example'),
            ),
          ],
        ),
      ),
    );
  }
}
