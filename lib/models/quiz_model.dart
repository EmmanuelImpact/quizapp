class QuizModel {
  final String question;
  final List<Map<String, Object>> answers;

  const QuizModel({
    required this.question,
    required this.answers,
  });
}
