import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/presentation/widgets/character_item.dart';

late List<Character> allCharacters;

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myDark,
        title: const Center(
          child: Text(
            'Characters',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          return buildLoadedListWidget(state.characters);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: myYellow,
            ),
          );
        }
      },
    );
  }

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

  Widget buildCharactersList(List<Character> characters) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(character: characters[index]);
      },
    );
  }
}
