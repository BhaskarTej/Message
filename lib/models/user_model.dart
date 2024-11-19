class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String role;
  final DateTime registrationDateTime;
  final String email;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.registrationDateTime,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'registrationDateTime': registrationDateTime.toIso8601String(),
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      registrationDateTime: DateTime.parse(map['registrationDateTime']),
      email: map['email'],
    );
  }
}
