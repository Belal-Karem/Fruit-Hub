class UserEntity {
  final String email;
  final String name;
  final String password;
  final String? uId;

  UserEntity({
    required this.email,
    required this.password,
    required this.uId,
    required this.name,
  });
}
