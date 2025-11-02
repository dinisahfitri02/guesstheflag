import 'package:flutter/material.dart';
import 'package:guesstheflag/data/dummy_data.dart';
import 'package:guesstheflag/models/question.dart';
import '../widgets/app_scaffold.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0; // index pertanyaan aktif
  late Question currentQuestion;

  @override
  void initState() {
    super.initState();
    currentQuestion = DummyData.questionList[currentIndex];
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

          return Center(
            child: Container(
              width: maxWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.07),

                  //number Quest
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          '${currentQuestion.id}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.04),
                          child: LinearProgressIndicator(
                            value:
                            (currentIndex + 1) / DummyData.questionList.length,
                            color: Colors.purple,
                            backgroundColor: Colors.white54,
                            minHeight: 3,
                          ),
                        ),
                      ),
                      const Icon(Icons.toggle_on,
                          color: Colors.black87, size: 40),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  //flag
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA10D99),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          currentQuestion.image,
                          height: screenHeight * 0.18,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        const Text(
                          "What country is this?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.1),

                  // Pilihan jawaban
                  ...currentQuestion.options.map(
                        (option) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA10D99),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize:
                          Size(double.infinity, screenHeight * 0.07),
                        ),
                        onPressed: () {
                          if (currentIndex < DummyData.questionList.length - 1) {
                            setState(() {
                              currentIndex++;
                              currentQuestion = DummyData.questionList[currentIndex];
                            });
                          } else {
                            //halaman hasil
                          }
                        },
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
