class User {
  final int id;
  final String name;
  final String email;
  final String age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}
