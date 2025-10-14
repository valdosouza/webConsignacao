import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  // Helpers
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print("📏 Largura atual da tela: ${size.width}");

    if (size.width >= 1100) {
      print("🖥️ Layout escolhido: DESKTOP");
      return desktop;
    } else if (size.width >= 850 && tablet != null) {
      print("📱 Layout escolhido: TABLET");
      return tablet!;
    } else {
      print("📞 Layout escolhido: MOBILE");
      return mobile;
    }
  }
}
