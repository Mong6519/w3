class User{
  final String id;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,

  });

  factory User.fromJson(Map<String, dynamic> Json){
    return User(
      id: Json['id'],
      name: Json['name'],
      avatar: Json['avatar'],
    );
  }
}