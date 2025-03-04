class UserEntity {
  String id;
  String name;
  String email;
  String createdAt;
  Map userData;
  Map appData;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.createdAt,
      required this.userData,
      required this.appData});
}
