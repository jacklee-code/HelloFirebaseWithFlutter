class QuestionAnswer {
  String ID = '';
  int QuestionType = -1;
  int TopicType = -1;
  String Question = '';
  List<String> Options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> OptionTips = ['Tip 1', 'Tip 2', 'Tip 3', 'Tip 4'];
  List<int> Answers = [-1];

  QuestionAnswer.fromMap(Map<String, dynamic> map, String id) {
    ID = id;
    QuestionType = map['question_type'];
    TopicType = map['topic_type'];
    Question = map['question'];
    Options = (map['options'] as List).map((e) => e as String).toList();
    OptionTips = (map['option_tips'] as List).map((e) => e as String).toList();
    Answers = (map['answer'] as List).map((e) => e as int).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'question_type' : QuestionType,
      'topic_type' : TopicType,
      'question' : Question,
      'options' : Options,
      'option_tips' : OptionTips,
      'answer' : Answers
    };
  }
}