class User {
  int id;
  String name;
  String email;
  DateTime createdAt;
  Map<dynamic, dynamic> userData;
  Map<dynamic, dynamic> appData;

  User({required this.id, required this.name, required this.email, required this.createdAt, required this.userData, required this.appData});
}
