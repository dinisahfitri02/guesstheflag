import 'package:flutter/material.dart';
import 'package:guesstheflag/data/dummy_data.dart';
import 'package:guesstheflag/models/question.dart';
import '../widgets/app_scaffold.dart';
import 'Result.dart';
import 'package:guesstheflag/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  final String playerName;
  final int totalQuestions;

  const QuestionScreen({
    super.key,
    required this.playerName,
    required this.totalQuestions,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  late List<Question> _questions;
  late Question currentQuestion;
  bool answered = false;
  String? selectedOption;
  int correct = 0; // menghitung jawaban benar
  int wrong = 0;   // menghitung jawaban salah

  @override
  void initState() {
    super.initState();
    // Ambil jumlah soal sesuai pilihan user
    _questions = DummyData.questionList.take(widget.totalQuestions).toList();
    currentQuestion = _questions[currentIndex];
  }

  void _nextQuestion(String option) {
    // Cek apakah benar
    if (option == currentQuestion.answer) {
      correct++;
    } else {
      wrong++;
    }

    setState(() {
      answered = true;
      selectedOption = option;
    });

    // Lanjut ke soal berikut setelah delay 1.5 detik
    Future.delayed(const Duration(seconds: 2), () {
      if (currentIndex < _questions.length - 1) {
        setState(() {
          currentIndex++;
          currentQuestion = _questions[currentIndex];
          answered = false;
          selectedOption = null;
        });
      } else {
        // Semua soal selesai → pindah ke ResultScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              playerName: widget.playerName,
              wrong: wrong,
              total: widget.totalQuestions,
            ),
          ),
        );
      }
    });
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

                  // Nomor soal dan progress bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          '${currentIndex + 1}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.04),
                          child: LinearProgressIndicator(
                            value: (currentIndex + 1) / _questions.length,
                            color: const Color(0xFFA10D99),
                            backgroundColor: Colors.white,
                            minHeight: 3,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  // Gambar bendera
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
                  ...currentQuestion.options.map((option) {
                    return AnswerButton(
                      text: option,
                      answered: answered,
                      isCorrect: option == currentQuestion.answer,
                      isSelected: selectedOption == option,
                      onTap: answered ? null : () => _nextQuestion(option),
                      buttonHeight: screenHeight * 0.07,
                      screenWidth: screenWidth,
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
