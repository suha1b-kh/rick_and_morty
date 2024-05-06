import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/presentation/widgets/character_list.dart';
import 'package:rick_and_morty/presentation/widgets/loaded_list.dart';

late List<Character> allCharacters;
late List<Character> searchedForCharacters;
bool isSearching = false;
final searchTextController = TextEditingController();

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: myYellow,
      decoration: const InputDecoration(
        hintText: 'Find a Patient...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color(0xFF1B2A57),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
      style: const TextStyle(
        color: Color(0xFF1B2A57),
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Color(0xFF1B2A57),
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: Color(0xFF1B2A57),
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    clearSearch();

    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget buildAppBarTitle() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/userr.png'),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              'Welcome Back,',
              style: TextStyle(
                color: Color(0xFFADA4A5),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
            Text(
              'Diente student',
              style: TextStyle(
                color: Color(0xFF1B2A57),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: myDark,
              ),
            ),
            Image.asset('assets/images/no-wifi.png')
          ],
        ),
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: myYellow,
      ),
    );
  }

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

/*
*****************************************************************************************
*/
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
        title: isSearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          // log('state: $state');
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }
}
