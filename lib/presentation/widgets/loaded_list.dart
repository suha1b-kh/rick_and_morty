import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/presentation/widgets/character_list.dart';

Widget buildLoadedListWidget(List<Character> characters) {
  return SingleChildScrollView(
    child: Container(
      color: myDark,
      child: Column(
        children: [
          buildCharactersList(characters),
        ],
      ),
    ),
  );
}
