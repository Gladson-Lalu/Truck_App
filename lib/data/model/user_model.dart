class UserModel {
  final String name;
  final String email;
  final String uid;
  final String photoUrl;
  final String phoneNumber;
  final String address;
  final String userType;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    this.photoUrl =
        "https://images.unsplash.com/photo-1541855492-581f618f69a0",
    required this.phoneNumber,
    required this.address,
    required this.userType,
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        uid = map['uid'],
        photoUrl = map['photoUrl'],
        phoneNumber = map['phoneNumber'],
        address = map['address'],
        userType = map['userType'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'address': address,
      'userType': userType,
    };
  }
}
