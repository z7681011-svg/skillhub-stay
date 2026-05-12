class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarInitials,
  });

  final String name;
  final String email;
  final String phone;
  final String avatarInitials;
}
