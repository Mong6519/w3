import 'dart:ffi';

class User{
  final String id;
  final String name;
  final String avatar;
  final Int age;
  final String birthdate;
  final String city;

  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.age,
    required this.birthdate,
    required this.city,

  });

  factory User.fromJson(Map<String, dynamic> Json){
    return User(
      id: Json['id'],
      name: Json['name'],
      avatar: Json['avatar'],
      age: Json['age'],
      birthdate: Json['birthdate'],
      city: Json['city'],
    );
  }
}