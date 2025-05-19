import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Represents an item in the customized navigation bar
class CustomizedNavItem {
  /// Title text displayed below the icon
  final String title;

  /// Active icon to be displayed when the item is selected
  final IconData? activeIconData;

  /// Inactive icon to be displayed when the item is not selected
  final IconData? inactiveIconData;

  /// Path to the SVG asset for active state
  final String? activeSvgPath;

  /// Path to the SVG asset for inactive state
  final String? inactiveSvgPath;

  /// Path to the image asset (PNG, JPG) for active state
  final String? activeImagePath;

  /// Path to the image asset (PNG, JPG) for inactive state
  final String? inactiveImagePath;

  /// Custom active icon widget (takes precedence over other types)
  final Widget? activeIconWidget;

  /// Custom inactive icon widget (takes precedence over other types)
  final Widget? inactiveIconWidget;

  /// Creates a CustomizedNavItem with either IconData, SVG paths, image paths, or custom widgets
  ///
  /// At least one type of icon must be provided. Priority order is:
  /// 1. Custom widgets (activeIconWidget, inactiveIconWidget)
  /// 2. SVG paths (activeSvgPath, inactiveSvgPath)
  /// 3. Image paths (activeImagePath, inactiveImagePath)
  /// 4. IconData (activeIconData, inactiveIconData)
  CustomizedNavItem({
    required this.title,
    this.activeIconData,
    this.inactiveIconData,
    this.activeSvgPath,
    this.inactiveSvgPath,
    this.activeImagePath,
    this.inactiveImagePath,
    this.activeIconWidget,
    this.inactiveIconWidget,
  }) : assert(
          (activeIconData != null && inactiveIconData != null) ||
              (activeSvgPath != null && inactiveSvgPath != null) ||
              (activeImagePath != null && inactiveImagePath != null) ||
              (activeIconWidget != null && inactiveIconWidget != null),
          'You must provide either IconData, SVG paths, image paths, or custom widgets for both active and inactive states',
        );

  /// Helper factory constructor to create an item using IconData
  factory CustomizedNavItem.withIcons({
    required String title,
    required IconData activeIcon,
    required IconData inactiveIcon,
  }) {
    return CustomizedNavItem(
      title: title,
      activeIconData: activeIcon,
      inactiveIconData: inactiveIcon,
    );
  }

  /// Helper factory constructor to create an item using SVG paths
  factory CustomizedNavItem.withSvg({
    required String title,
    required String activeSvgPath,
    required String inactiveSvgPath,
  }) {
    return CustomizedNavItem(
      title: title,
      activeSvgPath: activeSvgPath,
      inactiveSvgPath: inactiveSvgPath,
    );
  }

  /// Helper factory constructor to create an item using image paths (PNG, JPG)
  factory CustomizedNavItem.withImages({
    required String title,
    required String activeImagePath,
    required String inactiveImagePath,
  }) {
    return CustomizedNavItem(
      title: title,
      activeImagePath: activeImagePath,
      inactiveImagePath: inactiveImagePath,
    );
  }

  /// Helper factory constructor to create an item using custom widgets
  factory CustomizedNavItem.withWidgets({
    required String title,
    required Widget activeIcon,
    required Widget inactiveIcon,
  }) {
    return CustomizedNavItem(
      title: title,
      activeIconWidget: activeIcon,
      inactiveIconWidget: inactiveIcon,
    );
  }

  /// Builds the active icon widget based on the provided icon source
  Widget buildActiveIcon({double? size = 24}) {
    if (activeIconWidget != null) {
      return activeIconWidget!;
    } else if (activeSvgPath != null) {
      return SvgPicture.asset(
        activeSvgPath!,
        height: size,
        width: size,
      );
    } else if (activeImagePath != null) {
      return Image.asset(
        activeImagePath!,
        height: size,
        width: size,
      );
    } else if (activeIconData != null) {
      return Icon(
        activeIconData,
        size: size,
      );
    }
    // This should never happen due to the assert in the constructor
    return SizedBox(width: size, height: size);
  }

  /// Builds the inactive icon widget based on the provided icon source
  Widget buildInactiveIcon({double? size = 24}) {
    if (inactiveIconWidget != null) {
      return inactiveIconWidget!;
    } else if (inactiveSvgPath != null) {
      return SvgPicture.asset(
        inactiveSvgPath!,
        height: size,
        width: size,
      );
    } else if (inactiveImagePath != null) {
      return Image.asset(
        inactiveImagePath!,
        height: size,
        width: size,
      );
    } else if (inactiveIconData != null) {
      return Icon(
        inactiveIconData,
        size: size,
      );
    }
    // This should never happen due to the assert in the constructor
    return SizedBox(width: size, height: size);
  }
}
