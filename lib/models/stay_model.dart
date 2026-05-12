class StayModel {
  const StayModel({
    required this.id,
    required this.title,
    required this.hostName,
    required this.location,
    required this.pricePerNight,
    required this.rating,
    required this.skillName,
    required this.description,
  });

  final String id;
  final String title;
  final String hostName;
  final String location;
  final double pricePerNight;
  final double rating;
  final String skillName;
  final String description;

  String get name => title;
  List<String> get skills => [skillName];
}
