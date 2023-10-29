

class model {
  String? Topic;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? options;


  model(
      {this.Topic,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.options});

  model.fromJson(Map<String, dynamic> json) {
    Topic = json['category'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = Topic;
    data['difficulty'] = difficulty;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['options'] = options;
    return data;
  }
}