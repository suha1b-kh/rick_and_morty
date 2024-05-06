class Character {
  late int id;
  late String name;
  late String image;

  Character.fromJson(Map<String, dynamic> json) {
    name = json['firstName'] + ' ' + json['lastName'];
    id = json['age'];
    image = json['image'];
  }
}
