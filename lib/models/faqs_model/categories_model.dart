class CategoryModel {
  final int id;
  final String name;
  final String? sound;
  final int order;
  final String icon;

  CategoryModel({
    required this.id,
    required this.name,
    this.sound,
    required this.order,
    required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      sound: json['sound'],
      order: json['order'],
      icon: json['icon'],
    );
  }
}
