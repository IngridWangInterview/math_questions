import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koobit_math_questions/screens/question_page/question_page.dart';
import 'core/quiz_service.dart';

void main() {
  final service = QuizService();

  runApp(KooBitsMathQuestionsApp(service: service));
}

class KooBitsMathQuestionsApp extends StatelessWidget {
  final QuizService service;

  const KooBitsMathQuestionsApp({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<QuizService>(
      create: (context) => service,
      child: MaterialApp(
        title: 'KooBit Math Questions',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const QuestionsPage(title: 'KooBit Math Questions'),
        builder: (context, child) {
          return MediaQuery(
            // 字的大小不再受到系統影響
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? const SizedBox(),
          );
        },
      ),
    );
  }
}
