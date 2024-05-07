class User {
  late int id;
  late String name;
  late String image;

  User.fromJson(Map<String, dynamic> json) {
    name = json['firstName'] + ' ' + json['lastName'];
    id = json['age'];
    image = json['image'];
  }
}
