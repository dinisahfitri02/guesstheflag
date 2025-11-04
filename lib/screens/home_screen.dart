import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import 'package:guesstheflag/screens/question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  int? _selectedQuestions; // Menyimpan jumlah soal (5 atau 15)

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > 600;
          final maxWidth = isLargeScreen ? 400.0 : constraints.maxWidth;

          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: maxWidth,
                padding: EdgeInsets.all(screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),

                    // logo
                    Image.asset(
                      'assets/logo/logo_app.png',
                      width: screenWidth * 0.6,
                    ),

                    Text(
                      'Can you name the flags of the world?',
                      style: TextStyle(
                        fontSize: screenWidth * (isLargeScreen ? 0.03 : 0.04),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: screenHeight * 0.1),

                    Text(
                      'Enter Your Name',
                      style: TextStyle(
                        fontSize: screenWidth * (isLargeScreen ? 0.03 : 0.06),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // Name TextField
                    Container(
                      width: screenWidth * 0.8,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Your name",
                          hintStyle: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFA10D99),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.025,
                            horizontal: screenWidth * 0.055,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    Text(
                      'Number Of Questions',
                      style: TextStyle(
                        fontSize: screenWidth * (isLargeScreen ? 0.02 : 0.04),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    //pilihan jumlah soal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildQuestionButton(5, screenWidth),
                        SizedBox(width: screenWidth * 0.1),
                        _buildQuestionButton(15, screenWidth),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    //Start
                    SizedBox(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.075,
                      child: ElevatedButton(
                        onPressed: () {
                          final name = _nameController.text.trim();
                          if (name.isEmpty || _selectedQuestions == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  "Please enter your name and choose number of questions",
                                  textAlign: TextAlign.center,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                margin: const EdgeInsets.only(
                                  top: 1,
                                  left: 40,
                                  right: 40,
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            return;
                          }

                          // Navigasi ke QuestionScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionScreen(
                                playerName: name,
                                totalQuestions: _selectedQuestions!,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA10D99),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 10,
                          shadowColor: Colors.black,
                        ),
                        child: Text(
                          'S t a r t',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget untuk tombol pilihan jumlah soal
  Widget _buildQuestionButton(int number, double screenWidth) {
    final isSelected = _selectedQuestions == number;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedQuestions = number;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.purple : const Color(0xFFA10D99),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(screenWidth * 0.08),
        elevation: 4,
        shadowColor: Colors.black,
      ),
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
