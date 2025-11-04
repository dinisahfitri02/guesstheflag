import 'package:go_router/go_router.dart';
import 'package:guesstheflag/screens/home_screen.dart';
import 'package:guesstheflag/screens/question_screen.dart';
import 'package:guesstheflag/screens/result_screen.dart';
import 'package:guesstheflag/provider/app_state_provider.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/question',
      name: 'question',
      builder: (context, state) {
        final appState = context.read<AppStateProvider>();
        return QuestionScreen(
          playerName: appState.playerName,
          totalQuestions: appState.totalQuestions,
        );
      },
    ),
    GoRoute(
      path: '/result',
      name: 'result',
      builder: (context, state) => const ResultScreen(),
    ),
  ],
);
