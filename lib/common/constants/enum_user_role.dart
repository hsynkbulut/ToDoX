enum UserRole {
  admin('admin', 3),
  individualUser('individualUser', 2),
  corporateUser('corporateUser', 1),
  commonUser('commonUser', 0);

  const UserRole(this.name, this.level);

  final String name;
  final int level;

  @override
  String toString() => name;

  factory UserRole.fromJson(String? role) {
    switch (role) {
      case "admin":
        return UserRole.admin;
      case "individualUser":
        return UserRole.individualUser;
      case "corporateUser":
        return UserRole.corporateUser;
      default:
        return UserRole.commonUser;
    }
  }
}
