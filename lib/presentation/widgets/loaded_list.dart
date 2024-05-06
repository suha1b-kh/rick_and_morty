import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/colors.dart';

import 'package:rick_and_morty/presentation/widgets/character_list.dart';

Widget buildLoadedListWidgets() {
  return SingleChildScrollView(
    child: Container(
      color: myDark,
      child: Column(
        children: [
          buildCharactersList(),
        ],
      ),
    ),
  );
}
