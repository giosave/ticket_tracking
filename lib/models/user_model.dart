class UserModel {
  final int userId;
  final String userName;
  final String fullName;
  final String role;
  final String email;

  UserModel({
    required this.userId,
    required this.userName,
    required this.fullName,
    required this.role,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['UserId'],
      userName: json['UserName'],
      fullName: json['FullName'],
      role: json['Role'],
      email: json['Email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'UserName': userName,
      'FullName': fullName,
      'Role': role,
      'Email': email,
    };
  }
}