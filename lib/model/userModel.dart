class User {
  int? id;
  int? companyId;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;

  User({
    this.id,
    this.companyId,
    this.roleId,
    this.firstName,
    this.lastName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      companyId: json['company_id'],
      roleId: json['role_id'],
      firstName: json['first_name'].toString(),
      lastName: json['last_name'].toString(),
      email: json['email'].toString(),
    );
  }
}
