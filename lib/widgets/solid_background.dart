import 'package:flutter/material.dart';
class SolidBackground extends StatelessWidget {
  final Widget child;
  const SolidBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD8CAF6),
      child: child,
    );
  }
}