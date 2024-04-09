class QuestionModel {
  final int id;
  final int cateId;
  final String name;
  final String? sound;
  final String description;
  final int order;
  final int numViews;

  QuestionModel({
    required this.id,
    required this.cateId,
    required this.name,
    this.sound,
    required this.description,
    required this.order,
    required this.numViews,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      cateId: json['cateId'],
      name: json['name'],
      sound: json['sound'],
      description: json['description'],
      order: json['order'],
      numViews: json['numViews'],
    );
  }
}
