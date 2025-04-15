class ArtisanModel {
  int? id;
  String fullName;
  String location;
  String email;
  String phoneNumber;
  String password;
  String avatar;
  String category;
  double stars;

  ArtisanModel({
    this.id,
    required this.avatar,
    required this.email,
    required this.fullName,
    required this.location,
    required this.password,
    required this.phoneNumber,
    required this.category,
    required this.stars,
  });

  // Convert ArtisanModel to Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'location': location,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'avatar': avatar,
      'category': category,
      'stars': stars,
    };
  }

  // Create ArtisanModel from Map<String, dynamic>
  factory ArtisanModel.fromMap(Map<String, dynamic> map) {
    return ArtisanModel(
      id: map['id'],
      fullName: map['fullName'],
      location: map['location'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      avatar: map['avatar'],
      category: map['category'],
      stars: map['stars'],
    );
  }
}
