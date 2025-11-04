import 'package:flutter/material.dart';
import 'package:guesstheflag/data/dummy_data.dart';
import 'package:guesstheflag/models/question.dart';
import 'package:guesstheflag/widgets/app_scaffold.dart';
import 'package:guesstheflag/widgets/answer_button.dart';
import 'package:guesstheflag/provider/app_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void initState() {
    super.initState();
    _questions = DummyData.questionList.take(widget.totalQuestions).toList();
    currentQuestion = _questions[currentIndex];
  }

  void _nextQuestion(String option) {
    final appState = context.read<AppStateProvider>();

    if (option == currentQuestion.answer) {
      appState.addCorrect();
    } else {
      appState.addWrong();
    }

    setState(() {
      answered = true;
      selectedOption = option;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (currentIndex < _questions.length - 1) {
        setState(() {
          currentIndex++;
          currentQuestion = _questions[currentIndex];
          answered = false;
          selectedOption = null;
        });
      } else {
        context.go('/result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      body: Center(
        child: Container(
          width: screenWidth > 600 ? 400.0 : screenWidth,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('${currentIndex + 1}',
                        style: const TextStyle(color: Colors.black)),
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
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFA10D99),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
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
      ),
    );
  }
}
