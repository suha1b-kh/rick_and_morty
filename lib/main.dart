import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_route.dart';
import 'package:rick_and_morty/constants/strings.dart';

void main() {
  runApp(RickAndMorty(
    appRouter: AppRouter(),
  ));
}

class RickAndMorty extends StatelessWidget {
  final AppRouter appRouter;

  const RickAndMorty({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: allCharactersScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: RootBlock(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
   */
}
