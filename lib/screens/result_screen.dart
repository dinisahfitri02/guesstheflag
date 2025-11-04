import 'package:flutter/material.dart';
import 'package:guesstheflag/widgets/app_scaffold.dart';
import 'package:guesstheflag/provider/app_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;
    double percentage = 100 - ((appState.wrong / appState.totalQuestions) * 100);

    return AppScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Great job, ${appState.playerName}!',
                style: TextStyle(
                  fontSize: screenWidth * (isLargeScreen ? 0.03 : 0.05),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              Image.asset(
                percentage >= 70
                    ? 'assets/logo/gold_medal.png'
                    : 'assets/logo/silver_medal.png',
                width: screenWidth * 0.6,
              ),
              SizedBox(height: screenHeight * 0.1),
              Text(
                'Your final score',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.012,
                  horizontal: screenWidth * 0.07,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFA10D99),
                  borderRadius: BorderRadius.circular(screenWidth * 0.01),
                ),
                child: Text(
                  '${percentage.toStringAsFixed(0)}/100',
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.08),
              Text(
                percentage >= 70
                    ? 'Excellent! You really know the flags!'
                    : 'Good job! Keep practicing your flags!',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.08),
              SizedBox(
                width: screenWidth * 0.4,
                height: screenHeight * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    appState.reset();
                    context.go('/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA10D99),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.1),
                    ),
                  ),
                  child: Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}