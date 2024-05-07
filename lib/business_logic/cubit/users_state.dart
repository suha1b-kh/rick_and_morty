part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoaded extends UsersState {
  final List<User> users;
  UsersLoaded(this.users);
  // CharactersLoaded(List<Character> characters, {required this.characters});
}
