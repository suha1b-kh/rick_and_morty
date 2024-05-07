import 'dart:developer';

import 'package:rick_and_morty/data/models/users.dart';
import 'package:rick_and_morty/data/web_services/characters_call.dart';

class UsersRepository {
  final UsersWebServices usersWebServices;

  UsersRepository(this.usersWebServices);

  Future<List<User>> getAllUsers() async {
    final users = await usersWebServices.getAllUsers();

    users.map((user) => User.fromJson(user)).toList();

    log(users.toString());
    return users.map((user) => User.fromJson(user)).toList();
  }
}
