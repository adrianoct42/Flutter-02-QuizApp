class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // List.of cria uma nova lista baseada em uma, nesse caso na answers.
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
