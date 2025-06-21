import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 768 && width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static bool isLargerThan(BuildContext context, String breakpoint) {
    final width = MediaQuery.of(context).size.width;
    switch (breakpoint) {
      case 'MOBILE':
        return width >= 768;
      case 'TABLET':
        return width >= 1200;
      default:
        return false;
    }
  }

  static bool isSmallerThan(BuildContext context, String breakpoint) {
    final width = MediaQuery.of(context).size.width;
    switch (breakpoint) {
      case 'TABLET':
        return width < 768;
      case 'DESKTOP':
        return width < 1200;
      default:
        return false;
    }
  }
}