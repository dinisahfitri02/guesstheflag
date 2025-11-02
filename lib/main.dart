import 'package:flutter/material.dart';
import 'package:guesstheflag/screens/Question_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GuessTheFlagApp());
}

class GuessTheFlagApp extends StatelessWidget {
  const GuessTheFlagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess The Flag',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: const QuestionScreen(),
    );
  }
}
