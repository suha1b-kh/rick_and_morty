import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/presentation/widgets/build_loaded_list.dart';

Widget buildBlocWidget() {
  return BlocBuilder<CharactersCubit, CharactersState>(
    builder: (context, state) {
      if (state is CharactersLoaded) {
        return buildLoadedListWidget();
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
