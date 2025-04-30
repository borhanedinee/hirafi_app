class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String location;
  final String? profileImage; // Optional profile image URL

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.location,
    this.profileImage,
  });
}
