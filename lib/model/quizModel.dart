import 'dart:convert';

class QuizQuestion {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuizQuestion({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }
}

class QuizData {
  final List<QuizQuestion> questions;

  QuizData({required this.questions});

  factory QuizData.fromJson(Map<String, dynamic> json) {
    List<QuizQuestion> questions = [];
    for (var item in json['results']) {
      questions.add(QuizQuestion.fromJson(item));
    }
    return QuizData(questions: questions);
  }
}

QuizData parseQuizData(String jsonString) {
  Map<String, dynamic> json = jsonDecode(jsonString);
  return QuizData.fromJson(json);
}
