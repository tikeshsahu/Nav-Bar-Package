import 'package:flutter/foundation.dart';

/// Controller class for managing the navigation bar state
class CustomizedNavController extends ChangeNotifier {
  /// Current selected index in the navigation bar
  int _currentIndex;

  /// Creates a controller with an initial selected index
  CustomizedNavController([this._currentIndex = 0]);

  /// Get the current selected index
  int get currentIndex => _currentIndex;

  /// Update the selected index
  void changeIndex({required int value}) {
    if (_currentIndex != value) {
      _currentIndex = value;
      notifyListeners();
    }
  }
}
