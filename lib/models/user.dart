class User {
  final String uid;
  final String nickname;
  final String email;
  final String name;
  final String picture;
  final String updatedAt;
  final String address;
  final String plz;
  final String city;
  final String phoneNumber;
  final List<dynamic> roles;
  final List<dynamic> permissions;

  User(
      this.uid,
      this.nickname,
      this.email,
      this.name,
      this.picture,
      this.updatedAt,
      this.roles,
      this.permissions,
      this.address,
      this.plz,
      this.city,
      this.phoneNumber);

  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }

  bool hasRole(String role) {
    return roles.contains(role);
  }
}
