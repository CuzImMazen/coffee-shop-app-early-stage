import 'package:flutter/material.dart';

class NavigationBarButton extends StatelessWidget {
  const NavigationBarButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.selectedIcon,
  });
  final String label;
  final Icon icon;
  final Color color;
  final IconData selectedIcon;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: icon,
      label: label,
      selectedIcon: Icon(selectedIcon, color: color),
    );
  }
}
