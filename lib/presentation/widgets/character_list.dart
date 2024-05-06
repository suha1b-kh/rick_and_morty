import 'package:flutter/material.dart';

import 'package:rick_and_morty/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty/presentation/widgets/character_item.dart';

Widget buildCharactersList() {
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
        ? allCharacters.length
        : searchedForCharacters.length,
    itemBuilder: (ctx, index) {
      return CharacterItem(
        character: searchTextController.text.isEmpty
            ? allCharacters[index]
            : searchedForCharacters[index],
      );
    },
  );
}
