class ClientModel {
  int? id;
  String fullName;
  String location;
  String email;
  String phoneNumber;
  String password;
  String avatar;

  ClientModel({
    this.id,
    required this.avatar,
    required this.email,
    required this.fullName,
    required this.location,
    required this.password,
    required this.phoneNumber,
  });
}
