import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import 'package:guesstheflag/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String playerName;
  final int wrong;
  final int total;

  const ResultScreen({
    super.key,
    required this.playerName,
    required this.wrong,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    // Hitung skor dalam persen
    double percentage = 100 - ((wrong / total) * 100);

    return AppScaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),

                  // Teks sambutan
                  Text(
                    'Great job, $playerName!',
                    style: TextStyle(
                      fontSize: screenWidth * (isLargeScreen ? 0.03 : 0.05),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Gambar medali
                  Image.asset(
                    percentage >= 70
                        ? 'assets/logo/gold_medal.png'
                        : 'assets/logo/silver_medal.png',
                    width: screenWidth * 0.6,
                  ),

                  SizedBox(height: screenHeight * 0.1),

                  // Label skor
                  Text(
                    'Your final score',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // Nilai skor akhir
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

                  SizedBox(height: screenHeight * 0.03),

                  // Pesan motivasi
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

                  // Tombol kembali ke Home
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.075,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi balik ke HomeScreen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA10D99),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(screenWidth * 0.1),
                        ),
                        elevation: screenHeight * 0.007,
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

                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
