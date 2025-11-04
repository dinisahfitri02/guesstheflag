import 'package:flutter/material.dart';
import 'package:guesstheflag/widgets/solid_background.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SolidBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}