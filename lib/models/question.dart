class Question {
  final int id;
  final String image;
  final List<String> options;
  final String answer;

  const Question({
    required this.id,
    required this.image,
    required this.options,
    required this.answer,
  });
}
