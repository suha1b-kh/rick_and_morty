import 'dart:developer';

import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/web_services/characters_call.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();

    characters.map((character) => Character.fromJson(character)).toList();

    log(characters.toString());
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
