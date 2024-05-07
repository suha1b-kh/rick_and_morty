import 'package:flutter/material.dart';

import 'package:rick_and_morty/presentation/screens/users_screen.dart';
import 'package:rick_and_morty/presentation/widgets/user_item.dart';

Widget buildUsersList() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 2.5,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: searchTextController.text.isEmpty
        ? allUsers.length
        : searchedForUsers.length,
    itemBuilder: (ctx, index) {
      return UserItem(
        user: searchTextController.text.isEmpty
            ? allUsers[index]
            : searchedForUsers[index],
      );
    },
  );
}
