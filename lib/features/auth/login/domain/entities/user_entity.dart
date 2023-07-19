class UserEntity {
  final int? id;
  final String? nickname;
  final String? email;
  final String? password;

  UserEntity(this.id,
      {required this.email, required this.password, required this.nickname});
}
