import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guesstheflag/provider/app_state_provider.dart';
import 'package:guesstheflag/config/app_router.dart';
import 'package:guesstheflag/theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppStateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'GuesstheFlag',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
