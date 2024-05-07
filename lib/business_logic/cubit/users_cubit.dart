import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/users.dart';
import 'package:rick_and_morty/data/repositories/users_repository.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository usersRepository;
  List<User> user = [];

  UsersCubit(this.usersRepository) : super(UsersInitial());

  List<User> getAllUsers() {
    usersRepository.getAllUsers().then((users) {
      emit(UsersLoaded(users));
      user = users;
    });
    return user;
  }
}
