import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/presentation/widgets/character_item.dart';

Widget buildLoadedListWidget() {
  return SingleChildScrollView(
    child: Container(
      color: myGreen,
      child: Column(
        children: [
          buildCharactersList(),
        ],
      ),
    ),
  );
}

Widget buildCharactersList() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return characterItem();
    },
  );
}
