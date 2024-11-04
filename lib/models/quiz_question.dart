class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shffledList = List.of(answers);
    shffledList.shuffle();
    return shffledList;
  }
}
