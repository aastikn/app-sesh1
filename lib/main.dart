import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/answer.dart';
import 'package:quiz_app/Screens/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
    if (settings.name == '/answer') {
      final args = settings.arguments as List<String>? ?? [];
      return MaterialPageRoute(
        builder: (context) => answer(answers: args),
      );
    }// Handle other routes if needed
  },
      debugShowCheckedModeBanner: false,
      home: const questionr(),
    );
  }
}
