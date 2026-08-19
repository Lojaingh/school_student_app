class LoginResponse {
  final String token;
  final List<UserRole> roles;

  LoginResponse({
    required this.token,
    required this.roles,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    final rolesJson = data['role'] as List? ?? [];

    return LoginResponse(
      token: data['token'] as String,
      roles: rolesJson
          .map(
            (role) => UserRole.fromJson(
              Map<String, dynamic>.from(role),
            ),
          )
          .toList(),
    );
  }
}

class UserRole {
  final int roleId;
  final String title;

  UserRole({
    required this.roleId,
    required this.title,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      roleId: json['role_id'] as int,
      title: json['title'] as String,
    );
  }
}
