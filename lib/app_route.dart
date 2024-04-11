import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/constants/strings.dart';
import 'package:rick_and_morty/data/repositories/characters_repository.dart';
import 'package:rick_and_morty/data/web_services/characters_call.dart';
import 'package:rick_and_morty/presentation/screens/character_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersRepository charactersRepository;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: const CharactersScreen(),
          ),
        );
      // BlocProvider above "CharactersScreen to use in it"

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
