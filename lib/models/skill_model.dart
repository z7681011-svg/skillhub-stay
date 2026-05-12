class SkillModel {
  const SkillModel({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  String get name => title;
}
