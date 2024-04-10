import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/strings.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/presentation/screens/character_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen.dart';

class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: myYellow,
                    ),
                  ),
                ));
    }
  }
}
